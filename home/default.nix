{ pkgs, ... }:

{
  home.stateVersion = "24.11";

  # Archivos de configuración de tu entorno gráfico
  home.file.".config/sxhkd/sxhkdrc".source = ./sxhkdrc;
  home.file.".config/bspwm/bspwmrc" = {
    source = ./bspwmrc;
    executable = true;
  };
  home.file.".config/polybar".source = ./polybar;
  home.file.".config/nvim".source = ./nvim;

  # Git declarativo
  programs.git = {
    enable = true;
    userName = "jon";
    userEmail = "jon.garmilla.dev@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # Tu terminal Kitty
  programs.kitty.enable = true;

  # Direnv rápido
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Tus aplicaciones del día a día (sin terminales duplicadas)
  home.packages = with pkgs; [
    dmenu
    kdePackages.dolphin
    firefox
    vscode
    postman
    mpv
    qbittorrent
  ];

  programs.vim = {
    enable = true;
    extraConfig = ''
      set number
      set relativenumber
    '';
  };
}
