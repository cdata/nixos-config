{ ... }:
{
  services = {
    avahi.enable = true;
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    fstrim.enable = true;
    # NOTE: Re-enable when https://github.com/NixOS/nixpkgs/issues/321121 is fixed
    automatic-timezoned.enable = false;
    # NOTE: Needed in order to configure Yubikey OpenPGP app
    # pcscd.enable = true;
  };
  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';
}
