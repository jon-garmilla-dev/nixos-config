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
}
