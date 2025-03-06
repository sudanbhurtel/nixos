{ config, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        height = 28;
        spacing = 6;
        margin-top = 2;
        margin-bottom = 0;
        margin-left = 4;
        margin-right = 4;
        modules-left = [
          "network"
          "cpu"
          "memory"
          "temperature"
          "hyprland/window"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "wireplumber"
          "backlight"
          "tray"
          "battery"
          "clock"
        ];

        "network" = {
          format-wifi = "{signalStrength}% ";
          format-ethernet = "{bandwidthTotalBytes} 󰈀";
          tooltip-format-wifi = "{essid} {icon}";
          tooltip-format-ethernet = "{ifname} {icon}";
          format-disconnected = "Disconnected ";
          format-icons = [
            "󰢿"
            "󰢼"
            "󰢽"
            "󰢾"
          ];
        };
        "cpu" = {
          format = "{usage}% ";
          tooltip = false;
        };
        "memory" = {
          format = "{}% ";
        };
        "temperature" = {
          critical-threshold = 80;
          format-critical = "{temperatureC}°C {icon}";
          format = "{temperatureC}°C {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          tooltip = false;
        };
        "hyprland/window" = {
          format = "{}";
          icon = true;
          icon-size = 16;
          max-length = 25;
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "2" = "";
            "3" = "";
            "4" = "󱞏";
            default = "";
          };
          persistent-workspaces = {
            "*" = 4;
          };
        };
        "wireplumber" = {
          format = "{volume}% {icon}";
          format-muted = "";
          on-click = "helvum";
          format-icons = [
            ""
            ""
            ""
          ];
        };
        "backlight" = {
          format = "{percent}% {icon}";
          format-icons = [
            "󰃞"
            "󰃟"
            "󰃝"
            "󰃠"
          ];
          tooltip = false;
        };
        "battery" = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          interval = 5;
          format = "{capacity}% {icon}";
          format-full = "{capacity}% {icon}";
          format-charging = "{capacity}% 󰂄";
          format-icons = [
            "󰂎"
            "󰁻"
            "󰁽"
            "󰁿"
            "󰂁"
            "󰁹"
          ];
        };
        "clock" = {
          format = "{:%I:%M %p}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };
        reload_style_on_change = true;
      };

    };

    style = ''
      * {
          font-family: JetBrainsMono NF, Font Awesome, Iosevka NF;
          font-size: 16px;
          font-weight: bold;
      }
      window#waybar {
          background-color: rgba(0,0,0,0.5);
          border: 2px solid rgba(100,150,170,0.5);
          border-radius: 10px;
          transition-property: background-color;
          transition-duration: .5s;
      }
      button {
          box-shadow: inset 0 -3px transparent;
          border: none;
          border-radius: 0;
      }
      button:hover {
          background: inherit;
          color: #ff00ff;
      }
      #network,
      #cpu,
      #memory,
      #temperature,
      #wireplumber,
      #backlight,
      #battery,
      #clock,
      #tray {
          padding: 0 10px;
      }
      #window,
      #workspaces {
          margin: 0 4px;
      }
      #network {
          color: #3080f9;
      }
      #network.disconnected {
          color: #ff0000;
      }
      #cpu {
          color: #2ecc75;
      }

      #memory {
          color: #9b59fb;
      }

      #temperature {
          color: #f0932b;
      }

      #temperature.critical {
          color: #ff0000;
      }
      #window {
          color: #aecdef;
      }
      #workspaces button {
          padding: 0 8px;
          color: #159cca;
      }
      #workspaces button.active {
          color: #cd40dc;
      }
      #workspaces button.urgent {
          color: #ff0000;
      }
      #wireplumber {
          color: #a14400;
      }

      #wireplumber.muted {
          color: #ff0000;
      }
      #backlight {
          color: #91c9f9;
      }
      #battery {
          color: #ddbefe;
      }
      #battery.charging {
          color: #26A65B;
      }


      @keyframes blink {
          to {
              background-color: #ffffff;
              color: #000000;
          }
      }
      #battery.critical:not(.charging) {
          color: #ff0000;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: steps(12);
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }
      #clock {
          color: #7525f5;
      }
      #tray {
          color: #2980b9;
      }

      #tray > .passive {
          -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          color: #ff0000;
      }
    '';
  };
}
