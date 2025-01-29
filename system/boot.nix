{
  config,
  pkgs,
  inputs,
  ...
}:
{
  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        theme = inputs.nixos-grub-themes.packages.${pkgs.system}.nixos;
      };

    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    consoleLogLevel = 0;
    initrd = {
      kernelModules = [ "amdgpu" ];
      verbose = false;
    };
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        adi1090x-plymouth-themes
        nixos-bgrt-plymouth
      ];
    };
  };

}
