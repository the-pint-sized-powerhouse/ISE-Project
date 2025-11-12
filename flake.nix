{
  inputs = {
    # ----- NIX PACKAGES ----- #
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:/nixos/nixpkgs/master";

    # ----- NIXOS-HARDWARE ----- #
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };

    # ----- NIX-USER-REPOSITORY ----- #
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ----- HOME-MANAGER ----- #
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      #url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ----- NIX-INDEX ----- #
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ----- STYLIX ----- #
    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      #url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ----- NIXVIM ----- #
    nixvim = {
      url = "github:nix-community/nixvim/main";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # ------ NIX DECLERATIVE FLATPAKS ----- #
    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/latest";
    };

    # ----- SPICETIFY ------ #
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ----- NIXCORD ----- #
    nixcord = {
      url = "github:kaylorben/nixcord/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ----- ZEN-BROWSER ----- #
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
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
    zen-browser,
    ...
  }: let
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
      theme = "tokyodark";
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
      fionnbennett-desktop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          ./modules/hyprland/variables-desktop.nix
          nixvim.homeModules.nixvim
          stylix.homeModules.stylix
          spicetify-nix.homeManagerModules.default
          zen-browser.homeModules.twilight-official
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
          nixvim.homeManagerModules.nixvim
          stylix.homeModules.stylix
          spicetify-nix.homeModules.default
          nixcord.homeModules.nixcord
          zen-browser.homeModules.twilight-official
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
