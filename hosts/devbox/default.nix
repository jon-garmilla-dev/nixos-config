{ config, pkgs, lib, ... }:

{
  networking.hostName = "devbox";

  # UEFI start boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = false;
  boot.loader.systemd-boot.configurationLimit = 10;
  hardware.enableRedistributableFirmware = true;

  # Kernel
  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "ahci"
    "usb_storage"
    "usbhid"
    "sd_mod"
  ];

  services.fstrim.enable = true;
  zramSwap.enable = true;
  system.nixos.label = "stable";
}
