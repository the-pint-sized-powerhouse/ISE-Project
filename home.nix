{userSettings, ...}: {
  imports = [
    # ------ AERC ------ #
    ./modules/aerc.nix

    # ------- BAT ------- #
    ./modules/bat.nix

    # ------ BOTTOM ----- #
    ./modules/bottom.nix

    # ------- BTOP ------- #
    ./modules/btop.nix

    # -------- CAVA -------- #
    ./modules/cava.nix

    # ----- CHROMIUM ----- #
    ./modules/chromium.nix

    # ------- FASTFETCH -------- #
    ./modules/fastfetch.nix

    # --------- FIREFOX ----------- #
    ./modules/firefox/firefox.nix

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

    # ----- GITUI ------ #
    ./modules/gitui.nix

    # ---------- GTK ------------- #
    ./modules/gtk.nix

    # -------------- HOME-SETTINGS ------ #
    ./modules/home-settings.nix

    # ------------- HYPRLAND ---------- #
    ./modules/hyprland/hyprland.nix

    # ---------- IMV ----------- #
    ./modules/imv.nix

    # ----------- KITTY  ------------- #
    ./modules/kitty.nix

    # ----- MICROSOFT-OFFICE ----- #
    ./applications/microsoft-office/office.nix

    # ----- MPV ----- #
    ./modules/mpv.nix

    # --------- NIXVIM --------- #
    ./modules/nixvim/nixvim.nix

    # ---------- OBS-STUDIO ------------ #
    ./modules/obs-studio.nix

    # ---------- QT ----------- #
    ./modules/qt.nix

    # ------- SPICETIFY ------ #
    ./modules/spicetify.nix

    # ------- STYLIX ----------- #
    ./themes/home/stylix.nix
    ./themes/home/${userSettings.theme}.nix

    # ----- SWAYOSD ----- #
    ./modules/swayosd/swayosd.nix

    # --------- SWAYNC --------- #
    ./modules/swaync.nix

    # --------- ULAUNCHER --------- #
    ./modules/ulauncher/ulauncher.nix

    # ----- VIRTUALISATION ----- #
    ./modules/virtualisation.nix

    # ---------- WAYBAR ----------- #
    ./modules/waybar.nix

    # -------- WLOGOUT -------- #
    ./modules/wlogout/wlogout.nix

    # --------- YAZI ------------ #
    ./modules/yazi/yazi.nix

    # --------- ZATHURA ---------- #
    ./modules/zathura.nix

    # ---- ZED ----- #
    ./modules/zed.nix

    #./modules/zen-browser/zen-browser.nix
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
