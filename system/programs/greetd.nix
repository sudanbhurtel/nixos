{ config, lib, pkgs, ... }:
let
  hyprConfig = pkgs.writeText "greetd-hyprland-config" ''
    misc {
      disable_hyprland_logo = true 
    }
    animations {
      enabled = false
    }
    monitor = eDP-1,1920x1200@60,0x0,1.25
    exec-once = ${pkgs.greetd.regreet}/bin/regreet; hyprctl dispatch exit
  '';
in {
  services.greetd = {
    enable = true;
    vt = 7;
    settings = {
      default_session = {
        command = "${pkgs.hyprland}/bin/Hyprland -c ${hyprConfig}";
        user = "greeter";

      };
    };
  };
}
