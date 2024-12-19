{ pkgs, ... }:
{
  hardware.gpgSmartcards.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    enableBrowserSocket = true;
    pinentryPackage = pkgs.pinentry-curses;
    settings = {
      ignore-cache-for-signing = "";
      debug-pinentry = "";
      ttyname = "$GPG_TTY";
      debug-level = "guru";
      debug-all = "";
      log-file = "/tmp/gpg-agent.log";
    };
  };

  environment.shellInit = ''
    gpg-connect-agent /bye
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  '';

  services = {
    yubikey-agent.enable = true;
    pcscd.enable = true;
    udev.packages = [ pkgs.yubikey-personalization ];
  };
}
