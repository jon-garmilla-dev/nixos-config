{ config, pkgs, lib, ... }:

{
  networking.hostName = "devbox";

  # Arranque UEFI con systemd-boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = false;

  # Módulos del Kernel
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
}