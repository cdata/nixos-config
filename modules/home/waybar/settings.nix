{ ... }:
{
  programs.waybar.settings.mainBar = {
    position = "top";
    layer = "top";
    height = 32;
    margin-top = 0;
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;
    modules-left = [
      # "custom/launcher"
      "hyprland/workspaces"
    ];
    modules-center = [
      "clock"
    ];
    modules-right = [
      "tray"
      # "cpu"
      # "memory"
      # "disk"
      "pulseaudio"
      #"pulseaudio/slider"
      "battery"
      # "network"
      # "bluetooth"
      "custom/notification"
      # "custom/launcher"
    ];
    clock = {
      calendar = {
        format = { today = "<span color='#b4befe'><b><u>{}</u></b></span>"; };
      };
      format = "{:%H:%M}";
      tooltip = "true";
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format-alt = "{:%d/%m}";
    };
    "hyprland/workspaces" = {
      active-only = false;
      disable-scroll = true;
      format = "{icon}";
      on-click = "activate";
      format-icons = {
        sort-by-number = true;
      };
    };
    tray = {
      icon-size = 20;
      spacing = 8;
      show-passive-items = true;
    };
    pulseaudio = {
      format = "{icon} {volume}%";
      format-muted = "  {volume}%";
      format-icons = {
        default = [ " " ];
      };
      scroll-step = 5;
      on-click = "pamixer -t";
    };
    "pulseaudio/slider" = {
      orientation = "vertical";
    };
    battery = {
      format = "{icon} {capacity}%";
      format-icons = [ " " " " " " " " " " ];
      format-charging = " {capacity}%";
      format-full = " {capacity}%";
      format-warning = " {capacity}%";
      interval = 5;
      states = {
        warning = 20;
      };
      format-time = "{H}h{M}m";
      tooltip = true;
      tooltip-format = "{time}";
    };
    "custom/notification" = {
      tooltip = false;
      format = "";
      return-type = "json";
      exec-if = "which swaync-client";
      exec = "swaync-client -swb";
      on-click = "swaync-client -t -sw";
      on-click-right = "swaync-client -d -sw";
      escape = true;
    };
  };
}
