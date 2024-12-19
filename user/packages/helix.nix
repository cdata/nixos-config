{ pkgs, ... }:
{
  programs.helix = with pkgs; {
    enable = true;
    settings = {
      theme = "custom_transparent";
      # editor.cursor-shape = {
      #   normal = "block";
      #   insert = "bar";
      #   select = "underline";
      # };
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
        "inherits" = "dracula";
        "ui.background" = { };
      };
    };
  };
}
