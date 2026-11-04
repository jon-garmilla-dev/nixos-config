{ config, pkgs, lib, ... }:

{
  networking.hostName = "devbox";

  boot.loader.grub = {
    enable = true;
    splashImage = null;
  };

  boot.initrd.availableKernelModules = [
    "ata_piix"
    "uhci_hcd"
    "virtio_pci"
    "sr_mod"
    "virtio_blk"
  ];

  services.spice-vdagentd.enable = true;
  services.qemuGuest.enable = true;
  services.fstrim.enable = true;

  zramSwap.enable = true;
}
