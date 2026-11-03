{
  description = "NixOS dotfiles profesionales con Disko y host devbox";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, disko }:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.devbox = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        disko.nixosModules.disko
        ./hosts/devbox/disko.nix

        ./hosts/devbox/default.nix
        ./modules/core/default.nix
        ./modules/desktop/bspwm.nix

        {
          environment.systemPackages = [
            nixpkgs-unstable.legacyPackages.${system}.neovim
          ];
        }

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.dev = import ./home/default.nix;
        }
      ];
    };
  };
}
