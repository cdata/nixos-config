{ pkgs, config, ... }: 
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  environment.etc = {
    "libinput/local-overrides.quirks".text = ''
      [Keyboard]
      MatchUdevType=keyboard
      MatchName=Framework Laptop 16 Keyboard Module - ANSI Keyboard
      AttrKeyboardIntegration=internal
    '';
  };

  environment.systemPackages = with pkgs; [
    acpi
    brightnessctl
    cpupower-gui
    framework-tool
    powertop
  ];
  
  services = {    
    # thermald.enable = true;
    # cpupower-gui.enable = true;
    power-profiles-daemon.enable = true;

    fprintd.enable = true;
 
    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "PowerOff";
    };

    openssh.enable = true;
  };

  boot = {
    blacklistedKernelModules = [ "k10temp" ];
    kernelModules = [ "acpi_call" "cros_ec" "cros_ec_lpcs" "zenpower" ];
    kernelParams = [ "amd_pstate=active" "amdgpu.sg_display=0" ];
    extraModulePackages = with config.boot.kernelPackages;
      [
        acpi_call
        cpupower
        framework-laptop-kmod
        zenpower
      ]
      ++ [pkgs.cpupower-gui];
  };

  hardware.sensor.iio.enable = true;
  hardware.keyboard.qmk.enable = true;
}