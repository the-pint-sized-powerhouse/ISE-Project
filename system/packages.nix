{
  pkgs,
  pkgs-unstable,
  userSettings,
  inputs,
  ...
}: {
  # -------- STABLE ------- #
  environment.systemPackages =
    (with pkgs; [
      kdePackages.ark
      bat
      base16-schemes
      black
      btop
      calligraphy
      cava
      celluloid
      discover-overlay
      kdePackages.dolphin
      emote
      mediainfo
      fastfetch
      firefox
      firefoxpwa
      foot
      fragments
      fzf
      git
      gparted
      imv
      kitty
      jq
      kdePackages.qt6ct
      libreoffice-qt6-fresh
      libsForQt5.qt5ct
      lsd
      mpv
      nautilus
      nix-du
      nix-unit
      ntfs3g
      pavucontrol
      playerctl
      pokeget-rs
      pyprland
      python
      python3
      quickgui
      ripgrep
      spotify
      swaynotificationcenter
      swayosd
      swww
      thunderbird
      tldr
      udisks
      ulauncher
      unzip
      usbutils
      vencord
      volctl
      waybar
      waypaper
      wdisplays
      wev
      which
      wl-clipboard
      wlogout
      yazi
      zapzap
      zathura
      zed-editor
      zip
    ])
    # ----- UNSTABLE ----- #
    ++ (with pkgs-unstable; [
      alejandra
      discord
      gopls
      hclfmt
      hyprpolkitagent
      hyprshot
      lua
      markdown-oxide
      nchat
      neovim-unwrapped
      nixd
      nixfmt-rfc-style
      nix-output-monitor
      prettierd
      pyright
      basedpyright
      stylua
      wttrbar
      yamllint
      yamlfmt
    ])
    # ----- PYTHON-PACKAGES ----- #
    ++ (with pkgs.python312Packages; [
      libcst
      python-lsp-server
      pip
      psutil
    ])
    # --------- FISH PLUGINS --------- #
    ++ (with pkgs-unstable.fishPlugins; [
      autopair
      colored-man-pages
      done
      hydro
      puffer
      sponge
      transient-fish
    ]);

  services.flatpak.packages = [
    "io.github.giantpinkrobots.flatsweep"
    "com.usebottles.bottles"
    "io.frama.tractor.carburetor"
    "it.mijorus.whisper"
    "org.prismlauncher.PrismLauncher"
    "com.stremio.Stremio"
  ];

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
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
    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
    nix-index-database = {
      comma.enable = true;
    };
    # ----- temp ----- #
    steam.enable = true;
    gamemode.enable = true;
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}
