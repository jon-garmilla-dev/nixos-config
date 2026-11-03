{ pkgs, ... }:

{
  home.stateVersion = "24.11";

  home.file.".config/sxhkd/sxhkdrc".source = ./sxhkdrc;
  home.file.".config/bspwm/bspwmrc" = {
    source = ./bspwmrc;
    executable = true;
  };
  home.file.".config/polybar".source = ./polybar;
  home.file.".config/nvim".source = ./nvim;

  # Git declarativo básico (solo tus datos)
  programs.git = {
    enable = true;
    userName = "jon";
    userEmail = "jon.garmilla.dev@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # Direnv rápido con caché
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Solo las dos herramientas que tú pediste
  home.packages = with pkgs; [
    dmenu
    kdePackages.dolphin
  ];

  programs.vim = {
    enable = true;
    extraConfig = ''
      set number
      set relativenumber
    '';
  };
}
