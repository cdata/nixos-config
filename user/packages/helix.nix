{ pkgs, ... }:
{
  programs.helix = with pkgs; {
    enable = true;
    settings = {
      theme = "custom_transparent";
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = lib.getExe nixfmt-rfc-style;
      }
      {
        name = "rust";
        auto-format = true;
        formatter.command = lib.getExe rustfmt;
      }
    ];
    themes = {
      custom_transparent = {
        "inherits" = "rose_pine_moon";
        "ui.background" = { };
      };
    };
  };
}
