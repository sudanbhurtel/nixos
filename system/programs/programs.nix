{ config, pkgs, ... }:
{
  imports = [
    ./bash.nix
    ./greetd.nix
    ./regreet/regreet.nix
  ];

  ### Packages ###
  environment.systemPackages = with pkgs; [
    wget
    acpi
    nixfmt-rfc-style
    hicolor-icon-theme
    nixos-icons
    p7zip
  ];

  ### Programs ###
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    fish.enable = true;
    dconf.enable = true;
    light = {
      enable = true;
      brightnessKeys = {
        enable = true;
        step = 10;
      };
    };
  };
  ### Services ###
  services = {
    pipewire = {
      enable = true;
      audio.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      jack.enable = true;
      pulse.enable = true;

    };
    kmscon = {
      enable = true;
      hwRender = true;
      extraConfig = ''
        font-name=MesloLGS NF
        font-size=14
      '';
    };
    libinput.enable = true;
  };

}
