{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    # swww
    #swaybg
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    hyprpicker
    hyprpaper
    glib
    grim
    slurp
    wl-clip-persist
    wf-recorder
    wl-screenrec
    wayland
    direnv
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      # hidpi = true;
    };
    # enableNvidiaPatches = false;
    systemd.enable = true;
  };
}
