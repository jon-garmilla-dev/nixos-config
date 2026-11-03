{ config, pkgs, lib, ... }:

{
  networking.hostName = "devbox";

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";

  services.spice-vdagentd.enable = true;

  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "sr_mod" "virtio_blk" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  # Forzamos tu partición real para que arranque al instante
  fileSystems."/" = {
    device = lib.mkForce "/dev/vda1";
    fsType = "ext4";
  };
}
