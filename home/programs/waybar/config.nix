{ config, ... }:
{
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      margin = "8 8 0 8";
      spacing = 10;
      reload_style_on_change = true;

      modules-left = [
        "network"
        "cpu"
        "memory"
        "disk"
        "temperature"
        "hyprland/workspaces"
      ];
      modules-center = [ "hyprland/window" ];
      modules-right = [
        "tray"
        "pulseaudio"
        "backlight"
        "battery"
        "clock"
      ];

      "network" = {
        tooltip = false;
        format-wifi = "{essid}({signalStrength}%) {icon}";
        format-ethernet = "{ipaddr}/{cidr} {icon}";
        format-linked = "{ifname} (No IP) {icon}";
        format-disconnected = "No Network {icon}";
        format-alt = "{ifname}: {ipaddr}/{cidr} {icon}";
        format-icons = {
          wifi = [
            "󰤯 "
            "󰤟 "
            "󰤢 "
            "󰤥 "
            "󰤨 "
          ];
          ethernet = "";
          linked = "";
          disconnected = " ";
        };

      };
      "cpu" = {
        tooltip = false;
        format = "{load} {icon}";
        format-alt = "{usage}% {icon}";
        format-icons = " ";

      };
      "memory" = {
        tooltip = false;
        format = "{percentage}% {icon}";
        format-alt = "{used:0.1f}G/{total:0.1f}G {icon}";
        format-icons = " ";

      };
      "disk" = {
        tooltip = false;
        format = "{percentage_used}%  ";
        format-alt = "{specific_used:0.1f}G/{specific_total:0.1f}G  ";
        unit = "GB";

      };
      "temperature" = {
        tooltip = false;
        critical-threshold = 70;
        format = "{temperatureC}°C {icon}";
        format-critical = "{temperatureC}°C {icon}";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
      };
      "hyprland/window" = {
        max-length = 40;
      };

      "tray" = {
        icon-size = 20;
      };

      "pulseaudio" = {
        tooltip = false;
        reverse-scrolling = true;
        format = "{volume}% {icon} {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = "  {icon} {format_source}";
        format-muted = "  {format_source}";
        format-source = " ";
        format-source-muted = " ";
        format-icons = {
          headphone = " ";
          headset = "";
          phone = "";
          default = [
            " "
            " "
            " "
          ];
        };

      };
      "backlight" = {
        tooltip = false;
        on-scroll-up = "light -A 2%";
        on-scroll-down = "light -U 2%";
        reverse-scrolling = true;
        format = "{percent}% {icon}";
        format-icons = [
          "󰃞 "
          "󰃝 "
          "󰃟 "
          "󰃠 "
        ];
      };

      "battery" = {
        tooltip = false;
        interval = 10;
        states = {
          warning = 30;
          critical = 15;

        };
        format = "{capacity}% {icon}";
        format-full = "Full {icon}";
        format-charging = "{capacity}% {icon}";
        format-plugged = "{capacity}% {icon}";
        format-alt = "{time} {icon}";
        format-icons = {
          full = "󰂏";
          plugged = " ";
          charging = [
            "󰢟 "
            "󰢜 "
            "󰂆 "
            "󰂇 "
            "󰂈 "
            "󰢝 "
            "󰂉 "
            "󰢞 "
            "󰂊 "
            "󰂋 "
            "󰂅 "
          ];
          default = [
            "󰂎"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
        };
      };
      "clock" = {
        tooltip = false;
        interval = 60;
        format = "{:%H:%M 󱑁 }";
        format-alt = "{:%Y-%m-%d 󰸗 }";
      };
    };
  };
}
