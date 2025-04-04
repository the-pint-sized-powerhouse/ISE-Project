from ulauncher.api.client.Extension import Extension
from ulauncher.api.shared.action.ExtensionCustomAction import ExtensionCustomAction
from ulauncher.api.shared.action.DoNothingAction import DoNothingAction
from ulauncher.api.client.EventListener import EventListener
from ulauncher.api.shared.event import KeywordQueryEvent, ItemEnterEvent
from ulauncher.api.shared.item.ExtensionResultItem import ExtensionResultItem
from ulauncher.api.shared.action.RenderResultListAction import RenderResultListAction
from ulauncher.api.shared.action.HideWindowAction import HideWindowAction
from subprocess import Popen, PIPE
import logging
import gi
import os
import re

logger = logging.getLogger(__name__)

gi.require_version('Gtk', '3.0')
gi.require_version('Notify', '0.7')

from gi.repository import Notify

class ExecTerminal(Extension):

    def __init__(self):
        super(ExecTerminal, self).__init__()
        self.subscribe(KeywordQueryEvent, KeywordQueryEventListener())
        self.subscribe(ItemEnterEvent, ItemEnterEventListener())


class KeywordQueryEventListener(EventListener):

    def on_event(self, event, extension):
        data = event.get_argument()
        items = [
                ExtensionResultItem(
                    icon="images/terminal-icon.svg",
                    name="Run a shell command",
                    description="" if not data else 'Run "%s" in shell' % data,
                    on_enter=ExtensionCustomAction(data),
                    ),
                ]

        return RenderResultListAction(items)

class ItemEnterEventListener(EventListener):

    def run_command(self, command, stdin):
        if command == '':
            return stdin
        process = Popen(command.strip(), stdout=PIPE, stderr=PIPE, universal_newlines=True)
        stdout, stderr = process.communicate()
        if stderr:
            return stderr
        

    def on_event(self, event, extension):
        data = event.get_data() or ""
        tokens = []
        items = []
        if data == '':
            return RenderResultListAction(items)
        
        Notify.init("RunTerminal")
        regex = re.compile('[^\s"\']+|"([^"]*)"|\'([^\']*)\'')
        if '|' in data:
            tokens = data.split('|')
            parentTokens = []
            for match in re.finditer(regex, tokens[0]):
                parentTokens.append(tokens[0][match.start():match.end()])
            parentProcess = Popen(parentTokens, stdout=PIPE, stderr=PIPE, universal_newlines=True)

            last_process = parentProcess
            for token in tokens[1:]:
                childTokens = []

                for match in re.finditer(regex, token):
                    childTokens.append(token[match.start():match.end()])
                
                childProcess = Popen(childTokens, stdin=last_process.stdout, stdout=PIPE, stderr=PIPE, universal_newlines=True)
                childStdout, childStderr = childProcess.communicate()
                last_process.wait()

                if childStderr:
                    if extension.preferences['showStderr']:
                        Notify.Notification.new("Error '%s'" % ''.join(childTokens), childStderr, os.path.join(os.path.dirname(__file__), 'images/terminal-icon.svg')).show()
                    break
                if not childStderr:
                    stdin = childStdout
                    last_process = childProcess
                    
            if childStdout and extension.preferences['showStdout']:
                Notify.Notification.new("Output for '%s'" % data, childStdout, os.path.join(os.path.dirname(__file__), 'images/terminal-icon.svg')).show()
        else:
            parentTokens = []
            for match in re.finditer(regex, data):
                parentTokens.append(data[match.start():match.end()])
            process = Popen(parentTokens, stdout=PIPE, stderr=PIPE, universal_newlines=True)
            stdout, stderr = process.communicate()
        
            if stdout and extension.preferences['showStdout']:
                Notify.Notification.new("Output for '%s'" % data, stdout, os.path.join(os.path.dirname(__file__), 'images/terminal-icon.svg')).show()
            if stderr and extension.preferences['showStderr']:
                Notify.Notification.new("Error '%s'" % data, stderr, os.path.join(os.path.dirname(__file__), 'images/terminal-icon.svg')).show()
        Notify.uninit("RunTerminal")
        
if __name__ == '__main__':
    ExecTerminal().run()