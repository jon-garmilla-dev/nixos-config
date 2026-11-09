{ pkgs, ... }:

{
  imports = [
    ./ssh.nix
  ];

  home.stateVersion = "24.11";

  # Dotfiles Link 
  home.file.".config/sxhkd/sxhkdrc".source = ./sxhkdrc;
  home.file.".config/bspwm/bspwmrc" = {
    source = ./bspwmrc;
    executable = true;
  };
  home.file.".config/polybar".source = ./polybar;
  home.file.".config/nvim".source = ./nvim;

  # Dark Theme 
  gtk  = {
    enable = true;
    iconTheme = {
      name = "Papirus-dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };

  # Apps configuration
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
  
  programs.vim = {
    enable = true;
    extraConfig = ''
      set number
      set relativenumber
      if executable('rg')
        set grepprg=rg\ --vimgrep\ --smart-case
        set grepformat=%f:%l:%c:%m
      endif

      autocmd QuickFixCmdPost [^l]* cwindow
    '';
  };

  programs.fish.enable = true;

  # Pkgs
  home.packages = with pkgs; [
    #Utils
    dmenu
    pavucontrol
    arandr
    xorg.xrandr
    feh
    papirus-icon-theme
    picom

    # Development
    vscode
    postman

    # Web & Download
    firefox
    qbittorrent

    # Dir
    mpv
    vlc
    kdePackages.dolphin
  ];
}
