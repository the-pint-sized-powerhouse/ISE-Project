{
  inputs = {
    # Imports different repositories for use in the configuration
    # ----- NIX PACKAGES ----- # {Offical Nix packages}
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:/nixos/nixpkgs/master";

    # ----- NIXOS-HARDWARE ----- #
    nixos-hardware.url = "github:NixOS/nixos-hardware/master"; # (repo containing hardware configurations specific to certain hardware)

    # ----- NIX-USER-REPOSITORY ----- #
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs"; # Has the NUR follow nix packages so that all packages are compatible
    };

    # ----- HOME-MANAGER ----- #
    home-manager = {
      # (this module allows for the declerative configuration of software used by the home-user)
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ----- NIX-INDEX ----- #
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ----- STYLIX ----- #
    stylix = {
      # (This modules allows for the universal themeing of all software managed by the system, using Base16 colourschemes)
      url = "github:nix-community/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ----- NIXVIM ----- #
    nixvim = {
      # (allows for the declerative configuration of Neovim and its plugins)
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ------ NIX-FLATPAKS ----- #
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest"; # (allows for the declerative downloading and configuration of Flatpak applications)

    # ----- SPICETIFY ------ #
    spicetify-nix = {
      # (allows for the declerative configuration and themeing of spotify)
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ----- NIXCORD ----- #
    nixcord = {
      # (allows for the declerative configuration and themeing of Discord)
      url = "github:kaylorben/nixcord/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    # Outputs all inputs so that they are avaidable for use in modules
    nixpkgs,
    home-manager,
    nixpkgs-unstable,
    nixpkgs-master,
    nix-index-database,
    nixvim,
    nix-flatpak,
    stylix,
    spicetify-nix,
    nixcord,
    nixos-hardware,
    ...
  }: let
    # creates variables for values that are use frequently throughtout the config
    systemSettings = {
      system = "x86_64-linux";
      hostname = "sisyphus";
      timezone = "Europe/Dublin";
      locale = "en_IE.UTF-8";
    };

    userSettings = {
      username = "fionnbennett";
      name = "Fionn Bennett";
      email = "fionnbennett06@gmail.com";
      theme = "uwunicorn";
      fontPkg = "nerd-fonts.caskaydia-cove";
      fontSerif = "CaskaydiaCove NF";
      fontMono = "CaskaydiaCove NF";
      cursorPkg = "pkgs.bibata-cursors";
      cursorName = "Bibata-Modern-Classic";
    };

    inherit (nixpkgs) lib;
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "electron-33.4.11"
          "python-2.7.18.8"
          "dotnet-runtime-7.0.20"
          "dotnet-runtime-wrapped-7.0.20"
          "mbedtls-2.28.10"
        ];
      };
    };
    # Configuration of the package channels
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "electron-33.4.11"
          "python-2.7.18.8"
          "dotnet-runtime-7.0.20"
          "dotnet-runtime-wrapped-7.0.20"
          "mbedtls-2.28.10"
        ];
      };
    };
    pkgs-master = import nixpkgs-master {
      inherit system;
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [
          "electron-33.4.11"
          "python-2.7.18.8"
          "dotnet-runtime-7.0.20"
          "dotnet-runtime-wrapped-7.0.20"
        ];
      };
    };
  in {
    nixosConfigurations = {
      # imports modules to each system configuration
      desktop = lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          ./hosts/desktop/configuration.nix
          nixvim.nixosModules.nixvim
          stylix.nixosModules.stylix
          nix-flatpak.nixosModules.nix-flatpak
          nix-index-database.nixosModules.nix-index
        ];
        specialArgs = {
          inherit inputs;
          inherit pkgs;
          inherit pkgs-unstable;
          inherit pkgs-master;
          inherit systemSettings;
          inherit userSettings;
        };
      };
      laptop = lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          ./hosts/laptop/configuration.nix
          nixvim.nixosModules.nixvim
          stylix.nixosModules.stylix
          nix-flatpak.nixosModules.nix-flatpak
          nix-index-database.nixosModules.nix-index
          nixos-hardware.nixosModules.lenovo-thinkpad-t480
        ];
        specialArgs = {
          inherit inputs;
          inherit pkgs;
          inherit pkgs-unstable;
          inherit pkgs-master;
          inherit systemSettings;
          inherit userSettings;
        };
      };
    };
    homeConfigurations = {
      # imports modules to each home configuration
      fionnbennett-desktop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          ./modules/hyprland/variables-desktop.nix
          nixvim.homeModules.nixvim
          stylix.homeModules.stylix
          spicetify-nix.homeManagerModules.default
          nixcord.homeModules.nixcord
        ];
        extraSpecialArgs = {
          inherit inputs;
          inherit pkgs;
          inherit pkgs-unstable;
          inherit pkgs-master;
          inherit systemSettings;
          inherit userSettings;
        };
      };
      fionnbennett-laptop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          ./modules/hyprland/variables-laptop.nix
          nixvim.homeModules.nixvim
          stylix.homeModules.stylix
          spicetify-nix.homeManagerModules.default
          nixcord.homeModules.nixcord
        ];
        extraSpecialArgs = {
          inherit inputs;
          inherit pkgs;
          inherit pkgs-unstable;
          inherit pkgs-master;
          inherit systemSettings;
          inherit userSettings;
        };
      };
    };
  };
}
