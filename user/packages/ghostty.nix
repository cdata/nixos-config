{ ... }:
{
  programs.ghostty = {
    enable = true;

    settings = {
      background-opacity = 0.9;
      # SEE: https://github.com/ghostty-org/ghostty/issues/4626
      #background-blur-radius = 20;
      font-family = "Cascadia Code NF";
      font-family-bold = "Cascadia Code NF Bold";
      font-family-italic = "Cascadia Code NF Italic";
      font-family-bold-italic = "Cascadia Code NF Bold Italic";
      font-size = 11;
      font-feature = "+calt, +liga, +dlig";
      theme = "rose-pine-moon";
      window-decoration = "none";
      window-padding-x = 14;
      window-padding-y = 14;
    };
  };
}
