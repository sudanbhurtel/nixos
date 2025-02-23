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
    ./walker.nix
  ];
  ### Packages ###
  home.packages = with pkgs; [
    inputs.quickshell.packages.${pkgs.system}.default
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
}
