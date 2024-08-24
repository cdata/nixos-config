{ config, pkgs, ... }:
{
  home.packages = [ pkgs.hyprpaper ];

  services.hyprpaper = {
    enable = true;
    settings = {
      wallpaper = [
        ",~/Pictures/wallpaper/default.png"
      ];
      preload = [
        "~/Pictures/wallpaper/default.png"
      ];
      ipc = true;
    };
  };
}