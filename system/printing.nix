{ pkgs, ... }:

{
  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      gutenprint
      cups-filters
    ];
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };
}
