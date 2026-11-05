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
  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host luyando_local
          HostName 192.168.1.24
          User jongarmilla
          Port 22222
          IdentityFile ~/.ssh/server_Luyando

      Host luyando_online
          HostName 100.84.37.124
          User jongarmilla
          Port 22222
          IdentityFile ~/.ssh/server_Luyando

      Host roberjosu_online
          HostName 100.88.155.121
          User roberjosu
          IdentityFile ~/.ssh/pc_roberjosu

      Host phi_local
          HostName 192.168.1.23
          User phi_admin
          Port 33333
          IdentityFile ~/.ssh/server_phi

      Host phi_online
          HostName 100.98.112.64
          User phi_admin
          Port 33333
          IdentityFile ~/.ssh/server_phi

      Host factorio_online
          HostName 134.122.85.162
          User root
          IdentityFile ~/.ssh/server_factorio

      Host rho_server
          HostName 100.90.187.62
          User jon_garmilla_dev

      Host TallerGanzedo_online
          HostName 100.78.245.102
          User tallerGanzedo
          IdentityFile ~/.ssh/server_TallerGanzedo
          SetEnv TERM=xterm-256color

      Host TallerGanzedo_backup_online
          HostName 100.112.162.116
          User root
          IdentityFile ~/.ssh/server_Ganzedo_Backup

      Host luyando_server_nuremberg
          HostName 178.104.48.101
          User root
          IdentityFile ~/.ssh/luyando_server_nuremberg

      Host github.com
          HostName github.com
          User git
          IdentityFile ~/.ssh/id_ed25519
          IdentitiesOnly yes
    '';
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
    feh
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
