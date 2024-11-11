{ config, pkgs, ... }:
{
  home.packages = [ pkgs.hyprpaper ];

  services.hyprpaper = {
    enable = true;
    settings = {
      wallpaper = [
        ",~/Pictures/wallpaper/c64/165923.png"
      ];
      preload = [
        "~/Pictures/wallpaper/c64/101509.png"
        "~/Pictures/wallpaper/c64/138973.png"
        "~/Pictures/wallpaper/c64/165923.png"
        "~/Pictures/wallpaper/c64/169596.png"
        "~/Pictures/wallpaper/c64/179419.png"
        "~/Pictures/wallpaper/c64/206915.png"
        "~/Pictures/wallpaper/c64/211489.png"
        "~/Pictures/wallpaper/c64/211679.png"
        "~/Pictures/wallpaper/c64/211680.png"
        "~/Pictures/wallpaper/c64/218249.png"
        "~/Pictures/wallpaper/c64/219508.png"
        "~/Pictures/wallpaper/c64/219531.png"
        "~/Pictures/wallpaper/c64/234192.png"
        "~/Pictures/wallpaper/c64/239355.png"
        "~/Pictures/wallpaper/c64/241008.png"
        "~/Pictures/wallpaper/c64/242821.png"
        "~/Pictures/wallpaper/c64/243727.png"
      ];
      ipc = true;
    };
  };
}
