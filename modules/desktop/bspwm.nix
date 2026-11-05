{ pkgs, lib, ... }:

{
  services.xserver = {
    enable = true;
    xkb.layout = "es";
    windowManager.bspwm.enable = true;

    displayManager.sessionCommands = ''
      ${pkgs.xorg.xsetroot}/bin/xsetroot -cursor_name left_ptr &
    '';

    displayManager.lightdm = {
      enable = true;
      greeters.mini.enable = true;
      greeters.mini.user = "dev";
    };
  };

  services.displayManager.defaultSession = "none+bspwm";

  environment.etc."lightdm/lightdm-mini-greeter.conf".text = lib.mkForce ''
    [greeter]
    user = dev
    show-password-label = false
    password-label-text =
    invalid-password-text =
    show-input-cursor = false
    password-alignment = right
    password-character = -1

    [greeter-hotkeys]
    mod-key = meta
    shutdown-key = s
    restart-key = r
    hibernate-key = h
    suspend-key = u

    [greeter-theme]
    font = Sans
    font-size = 1rem
    font-weight = bold
    font-style = normal
    text-color = #d0d0d0
    error-color = #1a1a1a
    background-image = ""
    background-color = #000000
    window-color = #000000
    border-color = #000000
    border-width = 2px
    layout-space = 15
    password-character = -1
    password-color = #d0d0d0
    password-background-color = #000000
    password-border-color = #000000
    password-border-width = 2px
    password-border-radius = 0.341125em
  '';

  environment.systemPackages = with pkgs; [
    kitty
    dmenu
    sxhkd
    polybar
    firefox
    vim
    xorg.xsetroot
  ];
}
