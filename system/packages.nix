{
  pkgs,
  pkgs-unstable,
  userSettings,
  ...
}: {
  # Sets which packages will be installed onto the system
  environment.systemPackages =
    (with pkgs; [
      # ------ STABLE ------ #
      woeusb
      woeusb-ng
      mediawriter
      wget
      base16-schemes
      black
      calligraphy
      celluloid
      discover-overlay
      fastfetch
      kdePackages.dolphin
      emote
      fragments
      gparted
      hunspell
      jq
      kdePackages.ark
      kitty
      libreoffice-qt6-fresh
      mediainfo
      hunspell
      hunspellDicts.en_GB-ise
      nautilus
      neovim
      nix-du
      nix-unit
      ntfs3g
      pavucontrol
      pokeget-rs
      prismlauncher
      python3
      quickgui
      ripgrep
      thunderbird
      tldr
      udisks
      unzip
      usbutils
      vencord
      volctl
      wev
      which
      wl-clipboard
      yazi
      zapzap
      zip
      nodejs_latest
      pandoc
    ])
    # ----- UNSTABLE ----- #
    ++ (with pkgs-unstable; [
      discord
      hyprpolkitagent
      lua
      nchat
      nix-output-monitor
    ])
    # ----- PYTHON-PACKAGES ----- #
    ++ (with pkgs.python312Packages; [
      libcst
      python-lsp-server
      pip
      psutil
    ]);

  # Uses nix-flatpak module imported in the flake to download Flatpk applications
  services.flatpak.packages = [
    "io.github.giantpinkrobots.flatsweep"
    "com.usebottles.bottles"
    "io.frama.tractor.carburetor"
    "it.mijorus.whisper"
    "org.prismlauncher.PrismLauncher"
    "com.stremio.Stremio"
  ];

  # Dowloads programs with built in Nix Configuration
  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/${userSettings.username}/.dotfiles";
    };
    fish = {
      enable = true;
      package = pkgs.fish;
    };
    mtr = {
      enable = true;
      package = pkgs.mtr;
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    nix-index-database.comma.enable = true;
    steam.enable = true;
    gamemode.enable = true;
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}
