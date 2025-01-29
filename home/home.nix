{ config, pkgs, ... }:
{
  imports = [ ./programs/programs.nix ];

  ### Home ###
  home = {
    username = "sdn";
    homeDirectory = "/home/sdn";
    stateVersion = "24.05";

    ### Cursor ###
    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 18;
    };
  };

  fonts.fontconfig.enable = true;

  ### GTK ###
  gtk = {
    enable = true;
    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
    font = {
      package = pkgs.cascadia-code;
      name = "Cascadia";
      size = 18;
    };
  };
}
