{config, pkgs, lib, ... }:

{

  # Firmware 
  hardware.enableRedistributableFirmware = true;

  # CPU
  hardware.cpu.intel.updateMicrocode = true;

  # Graphic
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
    ];
  };

  # Kernel
  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "ahci"
    "usb_storage"
    "usbhid"
    "sd_mod"
  ];

  # Temperature control
  services.thermald.enable = true;

  # SSD Manteinance
  services.fstrim.enable = true;

  # Swap ( RAM Optimization)
  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };
}
