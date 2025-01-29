{ config, lib, ... }:
{
  wayland.windowManager.hyprland = {
    settings = {

      "$mainMod" = "SUPER";
      "$terminal" = "alacritty";
      "$launcher" = "pkill walker || walker";
      "$browser" = "firefox";
      "$editor" = "emacsclient -nc";
      "$exit" = "pkill wlogout || wlogout";
      "$lock" = "hyprlock";
      bind =
        [
          "$mainMod, RETURN, exec, $terminal"
          "$mainMod, R, exec, $launcher"
          "$mainMod, B, exec, $browser"
          "$mainMod SHIFT, Q, exec, $exit"
          "$mainMod SHIFT, L, exec, $lock"
          "$mainMod, E, exec, $editor;"
          "$mainMod, C, killactive,"
          "$mainMod, V, togglefloating,"
          "$mainMod, P, pseudo,"
          "$mainMod, J, togglesplit,"
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"
          "$mainMod, F, fullscreen, 0"
          "$mainMod, M, fullscreen, 1"
          "$mainMod, S, togglespecialworkspace, magic"
          "$mainMod SHIFT, S, movetoworkspace, special:magic"

          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"
        ]

        ++ (
          # workspaces
          builtins.concatLists (
            builtins.genList (
              x:
              let
                ws =
                  let
                    c = (x + 1) / 10;
                  in
                  builtins.toString (x + 1 - (c * 10));
              in
              [
                "$mainMod, ${ws}, workspace, ${toString (x + 1)}"
                "$mainMod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            ) 10
          )
        );

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindle = [
        # Audio
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
      bindl = [
        # Mute
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];
    };
  };
}
