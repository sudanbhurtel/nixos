{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./programs/programs.nix
  ];

  time.timeZone = "Asia/Seoul";
  i18n.defaultLocale = "en_US.UTF-8";
  hardware = {
    enableRedistributableFirmware = true;
  };
  fonts.packages = with pkgs; [ meslo-lgs-nf ];
  system.stateVersion = "24.05"; # Do not edit!!

  ### Console ###
  console = {
    font = "ter-v32n";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  };

  ### Networking ###
  networking = {
    hostName = "nixpad";
    networkmanager.enable = true;

    proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  ### Nix ###
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [ "https://walker.cachix.org" ];
    trusted-public-keys = [ "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM=" ];
  };

  ### Security ###
  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  ### Users ###
  users.users.sdn = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "network"
    ];
  };
}
