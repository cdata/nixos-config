{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      availableKernelModules = [ "usb_storage" "sd_mod" ];
      kernelModules = [ "amdgpu" ];
    };

    kernelModules = [ "zenpower" ];
    kernelParams = [ "amdgpu.sg_display=0" ];
  };

  environment.systemPackages = [ ];

  services = {
    fprintd.enable = true;
    openssh.enable = true;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      amdvlk
      vulkan-loader
      vulkan-validation-layers
      vulkan-extension-layer
      rocmPackages.clr
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };

  # Load AMD driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "amdgpu" ];
}

