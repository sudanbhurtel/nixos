{ config, ... }:
{

  imports = [
    ./layout.nix
    ./style.nix
  ];
  programs.wlogout = {
    enable = true;

  };
}
