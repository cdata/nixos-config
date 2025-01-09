{ pkgs, ... }:
{

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    dive # Tool for exploring docker image layers
    podman-tui
    podman-compose
    spice
    spice-gtk
    spice-protocol
    virt-manager
    virt-viewer
    win-spice
    win-virtio
  ];

  # Manage the virtualisation services
  virtualisation = {
    containers = {
      enable = true;
    };
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };

    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };

    spiceUSBRedirection.enable = true;
  };

  services.spice-vdagentd.enable = true;
}
