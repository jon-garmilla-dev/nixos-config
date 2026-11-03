{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    xkb.layout = "es";
    windowManager.bspwm.enable = true;
  };

  environment.systemPackages = with pkgs; [
    kitty
    alacritty
    dmenu
    sxhkd
    polybar
    firefox
    vim
  ];
}
