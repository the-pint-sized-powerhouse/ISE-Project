{ config, userSettings, ... }:

{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      layer = "top";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "application";
      control-center-margin-top = 0;
      control-center-margin-bottom = 0;
      control-center-margin-right = 0;
      control-center-margin-left = 0;
      notification-2fa-action = true;
      notification-inline-replies = false;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
    };
    style = with config.lib.stylix.colors; ''
      @define-color base00 #${base00-hex};
      @define-color base01 #${base01-hex};
      @define-color base02 #${base02-hex};
      @define-color base03 #${base03-hex};
      @define-color base04 #${base04-hex};
      @define-color base05 #${base05-hex};
      @define-color base06 #${base06-hex};
      @define-color base07 #${base07-hex};
      @define-color base08 #${base08-hex};
      @define-color base09 #${base09-hex};
      @define-color base0A #${base0A-hex};
      @define-color base0B #${base0B-hex};
      @define-color base0C #${base0C-hex};
      @define-color base0D #${base0D-hex};
      @define-color base0E #${base0E-hex};
      @define-color base0F #${base0F-hex};

      * {
          font-family: "${userSettings.fontSerif}";
          font-size: 10pt;
      }
      progress,
      progressbar,
      trough {
        border: 1px solid @base0E;
      }

      trough {
        background: @base01;
      }

      .notification.low,
      .notification.normal {
        border: 1px solid @base0E;
      }

      .notification.low progress,
      .notification.normal progress {
        background: @base0F;
      }

      .notification.critical {
        border: 1px solid @base08;
      }

      .notification.critical progress {
        background: @base08;
      }

      .summary {
        color: @base05;
      }

      .body {
        color: @base06;
      }

      .time {
        color: @base06;
      }

      .notification-action {
        color: @base05;
        background: @base01;
        border: 1px solid @base0E;
      }

      .notification-action:hover {
        background: @base01;
        color: @base05;
      }

      .notification-action:active {
        background: @base0F;
        color: @base05;
      }

      .close-button {
        color: @base02;
        background: @base08;
      }

      .close-button:hover {
        background: lighter(@base08);
        color: lighter(@base02);
      }

      .close-button:active {
        background: @base08;
        color: @base00;
      }

      .notification-content {
        background: @base00;
        border: 1px solid @base0E;
      }

      .floating-notifications.background .notification-row .notification-background {
        background: transparent;
        color: @base05;
      }

      .notification-group .notification-group-buttons,
      .notification-group .notification-group-headers {
        color: @base05;
      }

      .notification-group .notification-group-headers .notification-group-icon {
        color: @base05;
      }

      .notification-group .notification-group-headers .notification-group-header {
        color: @base05;
      }

      .notification-group.collapsed .notification-row .notification {
        background: @base01;
      }

      .notification-group.collapsed:hover
        .notification-row:not(:only-child)
        .notification {
        background: @base01;
      }

      .control-center {
        background: @base00;
        border: 1px solid @base0E;
        color: @base05;
      }

      .control-center .notification-row .notification-background {
        background: @base00;
        color: @base05;
      }

      .control-center .notification-row .notification-background:hover {
        background: @base00;
        color: @base05;
      }

      .control-center .notification-row .notification-background:active {
        background: @base0F;
        color: @base05;
      }

      .widget-title {
        color: @base05;
        margin: 0.5rem;
      }

      .widget-title > button {
        background: @base01;
        border: 1px solid @base0E;
        color: @base05;
      }

      .widget-title > button:hover {
        background: @base01;
      }

      .widget-dnd {
        color: @base05;
      }

      .widget-dnd > switch {
        background: @base01;
        border: 1px solid @base0E;
      }

      .widget-dnd > switch:hover {
        background: @base01;
      }

      .widget-dnd > switch:checked {
        background: @base0F;
      }

      .widget-dnd > switch slider {
        background: @base06;
      }

      .widget-mpris {
        color: @base05;
      }

      .widget-mpris .widget-mpris-player {
        background: @base01;
        border: 1px solid @base0E;
      }

      .widget-mpris .widget-mpris-player button:hover {
        background: @base01;
      }

      .widget-mpris .widget-mpris-player > box > button {
        border: 1px solid @base0E;
      }

      .widget-mpris .widget-mpris-player > box > button:hover {
        background: @base01;
        border: 1px solid @base0E;
      }
    '';
  };
}
