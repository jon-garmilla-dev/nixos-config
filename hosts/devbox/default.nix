{ config, pkgs, lib, ... }:

{
  networking.hostName = "devbox";

  # GRUB en negro absoluto sin imagenes de fondo
  boot.loader.grub = {
    enable = true;
    splashImage = null;          # Quita la imagen clara de NixOS en el arranque
    backgroundColor = "#000000"; # Fondo 100% negro
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
