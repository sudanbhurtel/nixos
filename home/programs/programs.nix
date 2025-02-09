{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./emacs.nix
    ./git.nix
    ./alacritty.nix
    ./hypr/hypr.nix
  ];
  ### Packages ###
  home.packages = with pkgs; [
    hyprsunset
    hyprpolkitagent
    hyprlock
    mate.mate-backgrounds
    budgie-backgrounds
    gnome-backgrounds
    nwg-bar
    waybar

    ### Fonts ###
    font-awesome
    cantarell-fonts
    noto-fonts
    noto-fonts-lgc-plus
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
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

  ];
  ### Programs ###
  programs = {
    firefox.enable = true;
    fuzzel.enable = true;
    btop.enable = true;
    imv.enable = true;

  };
  ### Services ###
  services.easyeffects.enable = true;
}
