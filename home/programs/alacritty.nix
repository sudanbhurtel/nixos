{ config, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "Iosevka Nerd Font Propo";
          style = "Regular";
        };
        size = 18;
      };
    };
  };

}
