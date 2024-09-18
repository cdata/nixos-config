{ pkgs, username, ... }:
{
  # Add user to libvirtd group
  users.users.${username}.extraGroups = [ "libvirtd" ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    dive
    podman-tui
    podman-compose
    spice
    spice-gtk
    spice-protocol
    virt-manager
    virt-viewer
    win-virtio
    win-spice
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
