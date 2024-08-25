{ config, pkgs, ... }:
{
  home.packages = [ pkgs.hyprpaper ];

  services.hyprpaper = {
    enable = true;
    settings = {
      wallpaper = [
        ",~/Pictures/wallpaper/c64/243727.png"
      ];
      preload = [
        "~/Pictures/wallpaper/c64/165923.png"
        "~/Pictures/wallpaper/c64/243727.png"
        "~/Pictures/wallpaper/c64/234192.png"
        "~/Pictures/wallpaper/c64/169596.png"
      ];
      ipc = true;
    };
  };
}
