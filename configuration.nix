{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # 1. Habilitar Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # 2. Bootloader GRUB para BIOS/VM
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";

  # 3. Idioma y teclado
  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "es_ES.UTF-8";
  console.keyMap = "es";

  # 4. Servidor gráfico (X11) y BSPWM
  services.xserver = {
    enable = true;
    xkb.layout = "es";
    windowManager.bspwm.enable = true;
  };

  # 5. Soporte para máquina virtual QEMU/KVM
  services.spice-vdagentd.enable = true;

  # 6. Activar nix-ld para LazyVim (Mason)
  programs.nix-ld.enable = true;

  # 7. Shell Fish activa en el sistema (sin mensaje de bienvenida)
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting
    '';
  };

  # 8. Tu usuario administrador con Fish por defecto
  users.users.jon = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "nixos";
    shell = pkgs.fish;
  };

  # 9. Paquetes esenciales del sistema y herramientas
  environment.systemPackages = with pkgs; [
    kitty
    alacritty
    dmenu
    sxhkd
    vim
    firefox
    polybar

    # Herramientas para LazyVim y compilación
    git
    gcc
    gnumake
    unzip
    wget
    curl
    ripgrep
    fd
    xclip
  ];

  system.stateVersion = "24.11";
}
