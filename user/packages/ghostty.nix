{ ... }:
{
  programs.ghostty = {
    enable = true;

    settings = {
      background-opacity = 0.9;
      # SEE: https://github.com/ghostty-org/ghostty/issues/4626
      #background-blur-radius = 20;
      font-family = "Cascadia Mono NF";
      font-family-bold = "Cascadia Mono NF SemiBold";
      font-family-italic = "Cascadia Mono NF Italic";
      font-family-bold-italic = "Cascadia Mono NF SemiBold Italic";
      font-size = 11;
      theme = "rose-pine-moon";
      window-decoration = false;
      window-padding-x = 14;
      window-padding-y = 14;
    };
  };
}
