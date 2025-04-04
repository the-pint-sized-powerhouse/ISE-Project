{
  # imported ...... into the flake, such as packages stream and other modules which can later be referenced in other code
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11"; # stable packages
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable"; # unstablepackages
    nixpkgs-master.url = "github:/nixos/nixpkgs/master"; # bleeding-edge packages
    home-manager = {
      url = "github:nix-community/home-manager/master"; # home-manager, manages app configs and files in the home directory
      inputs.nixpkgs.follows = "nixpkgs"; # has home-manager only use package versions from the nix stable packages repo
    };
    hyprland.url = "github:hyprwm/Hyprland?ref=v0.48.1";
    nixvim = {
      url = "github:nix-community/nixvim/main"; # allows home-manager to decleratively manage neovim using a nix launguage wrapper
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak"; # allows for the declerative installation and configuration  of flatpaks (alternative app packaging method)
    stylix = {
      url = "github:danth/stylix/master"; # allows for the stylix of all enabled applications using a base16 colourscheme
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix"; # allows for the declerative configuration of spicetify using a nix language wrapper
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    hypr-darkwindow = {
      url = "github:alexhulbert/Hyprchroma";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      nixpkgs-unstable,
      nixpkgs-master,
      nixvim,
      nix-flatpak,
      stylix,
      spicetify-nix,
      nixcord,
      hypr-darkwindow,
      hyprland,
      ...
    }:
    let
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
        theme = "dracula";
        fontPkg = "pkgs.nerdfonts";
        fontSerif = "0xProto Nerd Font";
        fontMono = "0xProto Nerd Font Mono";
        cursorPkg = "pkgs.bibata-cursors";
        cursorName = "Bibata-Modern-Classic";
      };

      inherit (nixpkgs) lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [
            "dotnet-runtime-7.0.20"
            "dotnet-runtime-wrapped-7.0.20"
          ];
        };
      };
      pkgs-master = import nixpkgs-master {
        inherit system;
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [
            "dotnet-runtime-7.0.20"
            "dotnet-runtime-wrapped-7.0.20"
          ];
        };
      };
      spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      nixosConfigurations = {
        desktop = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            ./hosts/desktop/configuration.nix
            nixvim.nixosModules.nixvim
            stylix.nixosModules.stylix
            nix-flatpak.nixosModules.nix-flatpak
          ];
          specialArgs = {
            inherit inputs;
            inherit pkgs-unstable;
            inherit pkgs-master;
            inherit systemSettings;
            inherit userSettings;
            inherit hypr-darkwindow;
            inherit hyprland;
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
          ];
          specialArgs = {
            inherit inputs;
            inherit pkgs-unstable;
            inherit pkgs-master;
            inherit systemSettings;
            inherit userSettings;
            inherit hypr-darkwindow;
            inherit hyprland;
          };
        };
      };
      homeConfigurations = {
        fionnbennett = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home.nix
            nixvim.homeManagerModules.nixvim
            stylix.homeManagerModules.stylix
            spicetify-nix.homeManagerModules.default
            nixcord.homeManagerModules.nixcord
          ];
          extraSpecialArgs = {
            inherit spicePkgs;
            inherit inputs;
            inherit pkgs-unstable;
            inherit pkgs-master;
            inherit systemSettings;
            inherit userSettings;
            inherit hypr-darkwindow;
            inherit hyprland;
          };
        };
      };
    };
}
