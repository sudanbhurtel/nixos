{ config, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = true;
      splash_color = "#74c7ec";
      preload = [ "~/.config/backgrounds/hyprpaper/wallpaper" ];
      wallpaper = [ ",~/.config/backgrounds/hyprpaper/wallpaper" ];
    };
  };
}
