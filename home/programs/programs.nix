{ config, pkgs, ... }:
{
  imports = [
    ./hypr/hypridle.nix
    ./hypr/hyprlock.nix
    ./hypr/hyprland.nix
    ./hypr/hyprpaper.nix
    ./waybar/waybar.nix
    ./wlogout/wlogout.nix
    ./emacs.nix
    ./alacritty.nix
    ./git.nix
  ];
  ### Packages ###
  home.packages = with pkgs; [
    hyprsunset
    hyprpolkitagent
    clipboard-jh
    unstable.walker
    stremio
    kodi-wayland
    waypaper

    ### fonts ###
    font-awesome
    cantarell-fonts
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
        "DejaVuSansMono"
        "FiraCode"
        "Inconsolata"
        "Iosevka"
        "SourceCodePro"
        "CascadiaCode"
      ];
    })
    noto-fonts
    noto-fonts-lgc-plus
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];
  ### Programs ###
  programs = {
    fuzzel.enable = true;
    btop.enable = true;
    imv.enable = true;
    firefox.enable = true;
  };
  ### Services ###
  services.easyeffects.enable = true;

}
