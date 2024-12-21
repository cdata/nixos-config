{ ... }:
{
  programs.kitty = {
    enable = true;

    themeFile = "rose-pine-moon";

    font = {
      name = "Cascadia Code PL";
      size = 11;
    };

    settings = {
      confirm_os_window_close = 0;
      background_opacity = "0.9";
      # background_blur = 10;
      window_padding_width = 10;
      hide_window_decorations = true;
      scrollback_lines = 10000;
      enable_audio_bell = false;
      mouse_hide_wait = 60;
      touch_scroll_multiplier = 2;
      # allow_remote_control = "yes";

      ## Tabs
      tab_title_template = "{index}";
      active_tab_font_style = "normal";
      inactive_tab_font_style = "normal";
      tab_bar_style = "powerline";
      tab_powerline_style = "round";
      active_tab_foreground = "#1e1e2e";
      active_tab_background = "#cba6f7";
      inactive_tab_foreground = "#bac2de";
      inactive_tab_background = "#313244";
    };

    keybindings = {
      ## Tabs
      "alt+1" = "goto_tab 1";
      "alt+2" = "goto_tab 2";
      "alt+3" = "goto_tab 3";
      "alt+4" = "goto_tab 4";

      ## Unbind
      "ctrl+shift+left" = "no_op";
      "ctrl+shift+right" = "no_op";
    };
  };
}
