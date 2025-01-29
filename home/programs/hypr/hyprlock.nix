{ config, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      "$font" = "JetBrainsMono Nerd Font Propo";
      "$fg-color" = "rgba(115,200,235,1)";
      "$bg-color" = "rgba(40, 50, 70, 0.9)";
      "$shadow-color" = "rgba(10, 10, 20, 0.5)";
      "$border-color" = "rgba(9,85,120,1)";
      "$selection-color" = "rgba(100,0,200,1)";
      "$alert-color" = "rgba(255,190,0,1)";
      "$warning-color" = "rgba(255,0,0,1)";
      general = {
        disable_loading_bar = true;
        grace = 5;
        hide_cursor = true;
      };
      # Background
      background = [
        {
          path = "/home/sdn/.config/backgrounds/hyprlock/wallpaper.jpg";
          color = "$bg-color";
        }
      ];
      # Input Field
      input-field = [
        {
          size = "230, 60";
          fade_on_empty = false;
          dots_size = 0.35;
          dots_spacing = 0.25;
          outer_color = "$border-color";
          inner_color = "$bg-color";
          font_color = "$fg-color";
          placeholder_text = "<span font_family='JetBrainsMono Nerd Font Propo' font_size='35pt' font_weight='bold'>󱅞 <span font_size='20pt' rise='8pt'>Welcome $USER!!</span></span>";
          check_color = "$selection-color";
          fail_color = "$warning-color";
          fail_text = "<span font_size='20pt'>Wrong Password<span>($ATTEMPTS)</span></span>";
          fail_transition = 500;
          rounding = 25;
          position = "0, 50";
          halign = "center";
          valign = "bottom";
        }
      ];
      label = [
        # Time-Hour
        {
          text = "cmd[update:30000] date +'%H'";
          color = "$alert-color";
          font_size = 250;
          font_family = "$font";
          shadow_passes = 1;
          shadow_size = 1;
          shadow_color = "$shadow-color";
          shadow_boost = 1.5;
          position = "0, -100";
          halign = "center";
          valign = "top";

        }
        # Time-Minute
        {
          text = "cmd[update:30000] date +'%M'";
          color = "$fg-color";
          font_size = 250;
          font_family = "$font";
          shadow_passes = 1;
          shadow_size = 1;
          shadow_color = "$shadow-color";
          shadow_boost = 1.5;
          position = "0, -375";
          halign = "center";
          valign = "top";

        }
        # Date
        {
          text = "cmd[update:43200000] echo \"<span> $(date +'%A,')</span><span color='##ffbf00ff'>$(date '+%d %B')</span>\"";
          color = "$fg-color";
          font_size = 30;
          font_family = "$font";
          shadow_passes = 1;
          shadow_size = 1;
          shadow_boost = 2.5;
          shadow_color = "$shadow-color";
          position = "0, 350";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}
