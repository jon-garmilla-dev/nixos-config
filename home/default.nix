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

  # Le dice a Dolphin que use los iconos de Papirus
  home.file.".config/kdeglobals".text = ''
    [Icons]
    Theme=Papirus-Dark
  '';

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

  # Tus aplicaciones del día a día con los iconos Papirus
  home.packages = with pkgs; [
    dmenu
    kdePackages.dolphin
    papirus-icon-theme       # <-- Tema de iconos Papirus
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
  programs.starship = {
    enable = true;
    enableFishIntegration =true;
    settings = {
        add_newline = false;
        kubernetes = {
            disabled = false;
          };
        };
      };
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}
