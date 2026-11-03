{
  description = "Configuracion de NixOS con Flakes y Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager }: 
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./hardware-configuration.nix
        ./configuration.nix

        # Inyectamos el binario de Neovim ya compilado de unstable directamente al sistema
        {
          environment.systemPackages = [
            nixpkgs-unstable.legacyPackages.${system}.neovim
          ];
        }

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.jon = { pkgs, ... }: {
            home.stateVersion = "24.11";

            # Tus dotfiles intactos
            home.file.".config/sxhkd/sxhkdrc".source = ./sxhkdrc;
            home.file.".config/bspwm/bspwmrc" = {
              source = ./bspwmrc;
              executable = true;
            };
	    home.file.".config/polybar".source = ./polybar;
            home.file.".config/nvim".source = ./nvim;
	    programs.vim = {
		enable = true;
		extraConfig = ''
		  set number
		  set relativenumber
		'';
		}; 
          };
        }
      ];
    };
  };
}
