{ config, pkgs, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        grace = 5;
        ignore_empty_input = true;
        immediate_render = true;
      };
      background = [
        {
          path = "${pkgs.budgie-backgrounds}/share/backgrounds/budgie/blue-periwinkle.jpg";
          blur_passes = 2;
        }
      ];
      image = [
        {
          path = "${pkgs.mate.mate-backgrounds}/share/backgrounds/mate/nature/Garden.jpg";
          rounding = 20;
          border_size = 2;
          border_color = "rgba(0,207,230,1.0)";
          position = "0, 220";

        }
      ];
      shape = [
        {
          size = "700, 200";
          color = "rgba(17,17,17,0.95)";
          rounding = 20;
          border_size = 2;
          position = "0, 0";
        }
      ];
      input-field = [
        {
          size = "350, 70";
          outline_thickness = 3;
          inner_color = "rgba(17,17,17,0.95)";
          outer_color = "rgba(150,100,220,1.0)";
          check_color = "rgba(0,100,0,1.0)";
          fail_color = "rgba(100,0,0,1.0)";
          font_color = "rgb(100, 190, 190)";
          font_family = "Iosevka Nerd Font Mono";
          fade_on_empty = false;
          placeholder_text = "<span font_size='20pt'><i>Input Password</i></span>";
          fail_text = "<span size='20pt'><i>$FAIL <b>($ATTEMPTS)</b></i></span>";
          swap_font_color = true;
          rounding = 15;
          position = "0, 150";
          valign = "bottom";

        }
      ];
      label = [
        {
          text = "cmd[update:1000] echo ''$(date)''";
          color = "rgba(0,150,240,1.0)";
          font_size = 25;
          font_family = "JetBrainsMono Nerd Font Mono";
          position = "0, -30";
          halign = "center";
          valign = "center";
        }
        {
          text = "Hello, Sudan!!";
          color = "rgba(160,160,0,1.0)";
          font_size = 25;
          font_family = "Cascadia Code NF";
          position = "0, 35";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
