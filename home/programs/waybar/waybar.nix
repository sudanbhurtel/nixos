{ config, ... }:
{
  imports = [
    ./config.nix
    ./style.nix
  ];
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
}
