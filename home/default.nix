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

  home.file.".config/kdeglobals".text = ''
    [Icons]
    Theme=Papirus-Dark
  '';

  programs.git = {
    enable = true;
    userName = "jon";
    userEmail = "jon.garmilla.dev@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.kitty.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.packages = with pkgs; [
    dmenu
    kdePackages.dolphin
    papirus-icon-theme
    firefox
    vscode
    postman
    mpv
    qbittorrent
    pavucontrol
    xorg.xrandr
    arandr
    gpicview
    vlc
  ];

  programs.vim = {
    enable = true;
    extraConfig = ''
      set number
      set relativenumber
    '';
  };

  programs.fish.enable = true;

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
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
