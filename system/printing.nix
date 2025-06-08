{ pkgs, ... }:

{
  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      gutenprint
      cups-filters
      hplip
      postscript-lexmark
      samsung-unified-linux-driver
      brlaser
      brgenml1lpr
      brgenml1cupswrapper
      cnijfilter2
      epson-escpr
      epson-escpr2
      epsonscan2
      epson-201401w
    ];
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
