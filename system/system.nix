{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware.nix
    ./programs/programs.nix
  ];

  time.timeZone = "Asia/Seoul";
  i18n.defaultLocale = "en_US.UTF-8";
  hardware.enableRedistributableFirmware = true;

  ### Boot ###
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        device = "nodev";
        efiSupport = true;
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernel.sysctl."kernel.sysrq" = 1;
  };

  ### Networking ###
  networking = {
    hostName = "nixpad";
    networkmanager.enable = true;
    proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  ### Console ###
  console = {
    font = "ter-v32n";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  };

  ### Nix ###
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  substituters = ["https://walker.cachix.org"];
  trusted-public-keys = ["walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="];
  };

  ### Security ###
  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  ### Environment ###
  
  ### Users ###
  users.users.sdn = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "network"
    ];
  };

  system.stateVersion = "24.11"; # ## Do not edit!!

}
