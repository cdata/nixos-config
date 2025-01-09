{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      cascadia-code
      google-fonts
      ibm-plex
      mononoki
      noto-fonts-emoji
      powerline-fonts
      source-code-pro
      source-sans-pro
      source-serif-pro
      ubuntu_font_family
      unifont
    ];

    fontconfig = {
      antialias = true;
      cache32Bit = true;
      hinting.enable = true;
      hinting.autohint = true;
      useEmbeddedBitmaps = true;
      defaultFonts = {
        monospace = [ "Cascadia Code" ];
        sansSerif = [ "IBM Plex Sans" ];
        serif = [ "IBM Plex Serif" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
