{
  disko.devices = {
    disk = {
      vda = {
        type = "disk";
        device = "/dev/vda";
        content = {
          type = "table";
          format = "msdos";
          partitions = [
            {
              name = "root";
              bootable = true;
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            }
          ];
        };
      };
    };
  };
}
