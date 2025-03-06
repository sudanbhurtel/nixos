{ config, pkgs, ... }:
{
 services.hyprpaper = {
 enable = true;
 settings =
{
  preload =
    [ "${pkgs.budgie-backgrounds}/share/backgrounds/budgie/perched-osprey.jpg" ];

  wallpaper = [
    ",${pkgs.budgie-backgrounds}/share/backgrounds/budgie/perched-osprey.jpg"
  ];
};
};
}