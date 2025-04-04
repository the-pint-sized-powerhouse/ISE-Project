{ pkgs, ... }:

{
  # ------- FISH ------- #
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
      fb = "bash -c $argv &";
      nrd = "sudo nixos-rebuild switch --flake ~/.dotfiles/#desktop";
      nrl = "sudo nixos-rebuild switch --flake ~/.dotfiles/#laptop";
      hr = "home-manager switch --flake ~/.dotfiles;hyprctl reload";
      frd = "sudo nix flake update --flake ~/.dotfiles; sudo nixos-rebuild switch --flake ~/.dotfiles#desktop; home-manager switch --flake ~/.dotfiles";
      frl = "sudo nix flake update --flake ~/.dotfiles; sudo nixos-rebuild switch --flake ~/.dotfiles/#laptop; home-manager switch --flake ~/.dotfiles";
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
    };
  };
}
