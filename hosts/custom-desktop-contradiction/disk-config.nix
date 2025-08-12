{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/sda"; # Change this to match your disk
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [
                  "defaults"
                ];
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "cryptroot";
                settings = {
                  allowDiscards = true;
                };
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];
                  subvolumes = {
                    # Root subvolume
                    "/root" = {
                      mountpoint = "/";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    # Home subvolume - separate for easier backups/snapshots
                    "/home" = {
                      mountpoint = "/home";
                      mountOptions = [ "compress=zstd" "noatime" "exec" ];
                    };
                    # Nix store - benefits from compression, no need to snapshot
                    "/nix" = {
                      mountpoint = "/nix";
                      mountOptions = [ "compress=zstd" "noatime" "exec" ];
                    };
                    # Logs - separate to prevent runaway logs from filling root
                    "/log" = {
                      mountpoint = "/var/log";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
