{ config, pkgs, lib, ... }:

{
  imports = [
    ./disko.nix
    ./hardware.nix
  ];
  
  networking.hostName = "devbox";

  #UEFI
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 10;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = false;

  system.nixos.label = "stable";

  # Window 
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

  services.logind.lidSwitch = "ignore";
  services.logind.lidSwitchExternalPower = "ignore";
  services.logind.lidSwitchDocked = "ignore";

  services.logind.extraConfig = ''
    IdleAction=ignore
    HandleSuspendKey=ignore
    HandleHibernateKey=ignore
  '';
}
