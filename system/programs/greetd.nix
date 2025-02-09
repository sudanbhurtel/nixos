{ config, lib, pkgs, ... }:
let
hyprConfig = pkgs.writeText "greetd-hyprland-config" ''
exec-once = ${pkgs.greetd.regreet}/bin/regreet; hyprctl dispatch exit
animations { 
enabled = false
}
misc {
disable_hyprland_logo = true
disable_splash_rendering = true
}
'';
in
{
services.greetd = {
      enable = true;
      vt = 3;
  settings.default_session = {
  command = "${pkgs.hyprland}/bin/Hyprland --config ${hyprConfig}&>/dev/null";
  };
};
programs.regreet = {
enable = true;
theme = { name = "Flat-Remix-GTK-Blue-Darkest"; package = pkgs.flat-remix-gtk;};
iconTheme = { name = "Adwaita";};
cursorTheme = { name = "Bibata-Modern-Amber";};
font = { name = "Cascadia Mono NF"; size = 14;};
};
}
