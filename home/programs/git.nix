{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "sudanbhurtel";
    userEmail = "sudanbhurtel@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      };
  };
}
