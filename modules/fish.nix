{pkgs, ...}: {
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "done";
        src = pkgs.fishPlugins.done;
      }
      {
        name = "sponge";
        src = pkgs.fishPlugins.sponge;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair;
      }
      {
        name = "puffer";
        src = pkgs.fishPlugins.puffer;
      }
    ];
    functions = {
      c = "clear";
      n = "nvim $argv";
      l = "lsd -a $argv";
      nrd = "sudo clear; cat ~/.dotfiles/splashes/systemRebuild; sudo nixos-rebuild switch --flake ~/.dotfiles/#desktop";
      nrl = "sudo clear; cat ~/.dotfiles/splashes/systemRebuild; sudo nixos-rebuild switch --flake ~/.dotfiles/#laptop";
      hrd = "clear; cat ~/.dotfiles/splashes/homeRebuild; home-manager switch --flake ~/.dotfiles/#fionnbennett-desktop"; # ~/.dotfiles/scripts/zen-browser-themer";
      hrl = "clear; cat ~/.dotfiles/splashes/homeRebuild; home-manager switch --flake ~/.dotfiles/#fionnbennett-laptop"; # ~/.dotfiles/scripts/zen-browser-themer";
      frd = "sudo clear; cat ~/.dotfiles/splashes/fullRebuild; nix flake update --flake ~/.dotfiles; sudo nixos-rebuild switch --flake ~/.dotfiles/#desktop; home-manager switch --flake ~/.dotfiles/#fionnbennett-desktop"; # ~/.dotfiles/scripts/zen-browser-themer";
      frl = "sudo clear; cat ~/.dotfiles/splashes/fullRebuild; nix flake update --flake ~/.dotfiles; sudo nixos-rebuild switch --flake ~/.dotfiles/#laptop; home-manager switch --flake ~/.dotfiles/#fionnbennett-laptop"; # ~/.dotfiles/scripts/zen-browser-themer";
      y = {
        description = "Yazi changes directory on exit";
        body = ''
          set tmp (mktemp -t "yazi-cwd.XXXXXX")
          yazi $argv --cwd-file="$tmp"
          if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
          end
          rm -f -- "$tmp"
        '';
      };
      mkdir = {
        description = "changes to newly created directory";
        body = ''
          command mkdir $argv
            if test $status = 0
              switch $argv[(count $argv)]
                case '-*'
                case '*'
                  cd $argv[(count $argv)]
                  return
              end
            end
        '';
      };
      gc = "git add *; git commit -m $argv; git push github main";
      nix-template = "nix flake init -t github:nix-community/templates#$argv";
      fetch = "fish";
      fbg = "bash -c $argv";
    };
  };
}
