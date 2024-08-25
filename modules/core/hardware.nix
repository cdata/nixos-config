{ pkgs, ... }:
{
  hardware.enableRedistributableFirmware = true;

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # Firmware updates
  services.fwupd.enable = true;

  # /tmp as tmpfs
  boot.tmp = {
    useTmpfs = true;
  };
}
