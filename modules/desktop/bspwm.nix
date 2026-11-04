{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    xkb.layout = "es";
    windowManager.bspwm.enable = true;

    # Flecha de raton normal (nada de X)
    displayManager.sessionCommands = ''
      ${pkgs.xorg.xsetroot}/bin/xsetroot -cursor_name left_ptr &
    '';

    displayManager.lightdm = {
      enable = true;
      # 1. QUITA LA FOTO DE FONDO Y EL LOGO DE NIXOS AL 100%
      background = "#000000";

      # 2. Desactiva el greeter viejo por defecto
      greeters.gtk.enable = false;

      # 3. Tu login minimalista
      greeters.mini = {
        enable = true;
        user = "dev";
        extraConfig = ''
          show-password-label = false
          password-label-text = ""
          invalid-password-text = ""
          show-input-cursor = false
          password-alignment = right
          password-character = -1

          [greeter-hotkeys]
          mod-key = meta
          shutdown-key = s
          restart-key = r

          [greeter-theme]
          font = "Sans"
          font-size = 1rem
          font-weight = bold
          text-color = "#d0d0d0"
          background-image = ""
          background-color = "#000000"
          window-color = "#000000"
          border-color = "#000000"
          password-color = "#d0d0d0"
          password-background-color = "#000000"
          password-border-color = "#000000"
        '';
      };
    };
  };

  environment.systemPackages = with pkgs; [
    kitty
    alacritty
    dmenu
    sxhkd
    polybar
    firefox
    vim
    xorg.xsetroot
  ];
}
