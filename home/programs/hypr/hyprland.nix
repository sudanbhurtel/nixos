{ config, pkgs, ... }:
{
  imports = [ ./keybinds.nix ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [ "--all" ];
    settings = {

      monitor = "eDP-1,1920x1200@60,0x0,1";
      windowrulev2 = "suppressevent maximize, class:.*";
      env = [
        "HYPRCURSOR_SIZE,24"
        "XCURSOR_SIZE,24"
      ];
      general = {
        gaps_in = 4;
        gaps_out = 8;

        border_size = 2;

        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        resize_on_border = false;

        allow_tearing = false;

        layout = "dwindle";
      };

      decoration = {
        rounding = 10;

        active_opacity = 1.0;
        inactive_opacity = 0.75;

        blur = {
          enabled = true;
          size = 3;
          passes = 1;

          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;

        sensitivity = 0.3;
        touchpad = {
          natural_scroll = true;
          scroll_factor = 1.3;
        };
      };

      gestures = {
        workspace_swipe = true;
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

    };
  };
}
