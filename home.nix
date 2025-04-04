{ userSettings, ... }:

{
  # imports home-manager modules
  imports = [
    # ------ AERC ------ #
    ./modules/aerc.nix

    # ------- BAT ------- #
    ./modules/bat.nix

    # ------- BTOP ------- #
    ./modules/btop.nix

    # -------- CAVA -------- #
    ./modules/cava.nix

    # ------- FASTFETCH -------- #
    ./modules/fastfetch.nix

    # ----------- FISH ------------- #
    ./modules/fish.nix

    # ---- FONTS ---- #
    ./fonts/fonts.nix

    # ---------- FOOT ------------ #
    ./modules/foot.nix

    # ------------ FZF ------------- #
    ./modules/fzf.nix

    # ---------- GIT --------------#
    ./modules/git.nix

    # ---------- GTK ------------- #
    ./modules/gtk.nix

    # -------------- HOME-SETTINGS ------ #
    ./modules/home-settings.nix

    # ------------- HYPRLAND ---------- #
    ./modules/hyprland/hyprland.nix

    #---------- HYPRLOCK --------- #
    ./modules/hyprlock.nix

    # ---------- IMV ----------- #
    ./modules/imv.nix

    # ----------- KITTY  ------------- #
    ./modules/kitty.nix

    # --------- LIBREWOLF ----------- #
    ./modules/librewolf/librewolf.nix

    # ----- MICROSOFT-OFFICE ----- #
    ./applications/microsoft-office/office.nix

    # ----- MPV ----- #
    #./modules/mpv.nix

    # -------- NIXCORD ------- #
    #./modules/nixcord.nix

    # --------- NIXVIM --------- #
    ./modules/nixvim/nixvim.nix

    # ---------- OBS-STUDIO ------------ #
    ./modules/obs-studio.nix

    # ---------- QT ----------- #
    ./modules/qt.nix

    # ------- SPICETIFY ------ #
    ./modules/spicetify.nix

    # ---- STEAM ---- #
    #./modules/steam.nix

    # ----- SWAYOSD ----- #
    ./modules/swayosd/swayosd.nix

    # --------- SWAYNC --------- #
    ./modules/swaync.nix

    # ------- STYLIX ----------- #
    ./themes/home/stylix.nix
    ./themes/home/${userSettings.theme}.nix

    # --------- ULAUNCHER --------- #
    ./modules/ulauncher/ulauncher.nix

    # ----- VIRTUALISATION ----- #
    ./modules/virtualisation.nix

    # ----- VSCODIUM ----- #
    #./modules/vscodium.nix

    # ---------- WAYBAR ----------- #
    ./modules/waybar.nix

    # -------- WLOGOUT -------- #
    ./modules/wlogout/wlogout.nix

    # --------- YAZI ------------ #
    ./modules/yazi/yazi.nix

    # --------- ZATHURA ---------- #
    ./modules/zathura.nix
  ];
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = true;
  };
  programs.home-manager.enable = true; # allows home-manager to manage itself
  home = {
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.05"; # do not change without consulting manual
  };
}
