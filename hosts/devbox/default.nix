{ config, pkgs, lib, ... }:

{
  networking.hostName = "devbox";

  # GRUB en negro: al poner splashImage en null, quita el logo y usa fondo negro nativo
  boot.loader.grub = {
    enable = true;
    splashImage = null;
  };

  services.spice-vdagentd.enable = true;

  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "sr_mod" "virtio_blk" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = lib.mkForce "/dev/vda1";
    fsType = "ext4";
  };
}
