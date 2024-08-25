{ ... }:
let
  custom = {
    font = "IBM Plex Sans";
    font_size = "15px";
    font_weight = "bold";
    text_color = "#cdd6f4";
    muted_text_color = "rgba(200, 210, 255, 0.5)";
    # text_color = "#adadad";
    secondary_accent = "89b4fa";
    tertiary_accent = "f5f5f5";
    background = "11111B";
    opacity = "1";
  };
in
{
  programs.waybar.style = ''

    * {
        border: none;
        border-radius: 0px;
        padding: 0;
        margin: 0;
        min-height: 0px;
        font-family: ${custom.font};
        font-weight: ${custom.font_weight};
        opacity: ${custom.opacity};
    }

    window#waybar {
        background: transparent;
        background-image: linear-gradient(90deg, rgba(73,59,90,0.5) 0%, rgba(159,78,68,0.5) 33%, rgba(60, 140,145,0.5) 66%, rgba(73,59,90,0.5) 100%);
        border-radius: 0px;
    }

    #workspaces {
        font-size: 18px;
        padding-left: 15px;
        
    }
    #workspaces button {
        color: ${custom.muted_text_color};
        padding-left:  6px;
        padding-right: 6px;
    }
    #workspaces button.empty {
        color: #6c7086;
    }
    #workspaces button.active {
        color: #b4befe;
        transition: none;
        animation: unset;
        border-top: 3px solid transparent;
        border-bottom: 3px solid #b4befe;
    }

    #tray, #pulseaudio, #network, #cpu, #memory, #disk, #clock, #battery, #custom-notification {
        font-size: ${custom.font_size};
        color: ${custom.text_color};
    }

    #cpu {
        padding-left: 15px;
        padding-right: 9px;
        margin-left: 7px;
    }
    #memory {
        padding-left: 9px;
        padding-right: 9px;
    }
    #disk {
        padding-left: 9px;
        padding-right: 15px;
    }

    #tray {
        padding: 0 20px;
        margin-left: 7px;
    }

    #pulseaudio {

        /*
        padding-left: 15px;
        padding-right: 9px;
        margin-left: 7px;
        */
    }
    #battery {
        padding-left: 9px;
        padding-right: 9px;
    }
    #network {
        padding-left: 9px;
        padding-right: 30px;
    }

    #custom-notification {
        padding-left: 20px;
        padding-right: 20px;
    }
    
    #clock {
        padding-left: 9px;
        padding-right: 15px;
        font-size: 1.5em;
        font-weight: 200;
    }

    #custom-launcher {
        font-size: 20px;
        color: #b4befe;
        font-weight: ${custom.font_weight};
        padding-left: 10px;
        padding-right: 15px;
    }
  '';
}
