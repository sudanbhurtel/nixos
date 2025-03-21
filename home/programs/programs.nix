{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./waybar.nix
    ./emacs.nix
    ./git.nix
    ./alacritty.nix
    ./hypr/hypr.nix
  ];
  ### Packages ###
  home.packages = with pkgs; [
    inputs.quickshell.packages.${pkgs.system}.default
    hyprsunset
    hyprpolkitagent
    mate.mate-backgrounds
    budgie-backgrounds
    gnome-backgrounds
    nwg-bar
    unstable.walker
    unstable.ags
    clipboard-jh
    ov
    moar
    mc
    ranger
    nnn
    lf
    yazi
    mate.caja
    lxqt.pcmanfm-qt
    xfce.thunar
    font-manager
    wluma

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
    wezterm = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      extraConfig = ''
        local wezterm = require 'wezterm'
        local config = {}
        config.font = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true })
        config.font_size = 16.0
        config.color_scheme = 'Batman'
        return config
      '';
    };
  };
  ### Services ###
  services.easyeffects.enable = true;
  services.udiskie.enable = true;
  services.conky.enable = true;
  services.blueman-applet.enable = true;
}
