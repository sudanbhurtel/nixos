{ config, pkgs, ... }:
let
hyprConfig = pkgs.writeText "greetd-hyprland-config" ''
exec-once = ${pkgs.greetd.regreet}/bin/regreet; hyprctl dispatch exit
animations {
enabled = false
}
misc {
disable_splash_rendering = true
}
'';
in
{
services.greetd = {
      enable = true;
      vt = 3;
  settings.default_session = {
  command = "${pkgs.hyprland}/bin/Hyprland --config ${hyprConfig}& >/dev/null";
  };
};
programs.regreet = {
enable = true;
};


}