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
    device = lib.mkForce "/dev/disk/by-uuid/a6b762a1-dbda-4e5b-bcdd-2640a3880940";
    fsType = "ext4";
  };
}
