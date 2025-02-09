{ config, pkgs, ... }:
{
  imports = [ ./greetd.nix ];
  ### Packages ###
  environment.systemPackages = with pkgs; [
    wget
    acpi
    brightnessctl
    nixfmt-rfc-style
    hicolor-icon-theme
    nixos-icons
    p7zip
    
  ];

  ### Programs ###
  programs = {
    fish.enable = true;
    dconf.enable = true;
    uwsm.enable = true;
    bash = {
      interactiveShellInit = ''
                if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        	then
        	  shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        	  exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
                fi
      '';
    };
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    foot = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      theme = "aeroroot";
    };
  };

  ### Services ###
  services = {
    pipewire = {
      enable = true;
      audio.enable = true;
      wireplumber.enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };
    libinput.enable = true;
    clight.enable = false;
    geoclue2.enable = true;
  };
}
