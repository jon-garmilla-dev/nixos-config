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

  programs.vim = {
    enable = true;
    extraConfig = ''
      set number
      set relativenumber
    '';
  };
}
