{ config, pkgs, ... }:
{
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
    hyprland = {
      enable = true;
      withUWSM = true;
    };
    bash = {
      interactiveShellInit = ''
                if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        	then
        	  shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        	  exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
                fi
      '';
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
    greetd = {
      enable = true;
      vt = 2;
  settings.default_session = {
  command = "${pkgs.greetd.greetd}/bin/agreety --cmd ${pkgs.hyprland}/bin/Hyprland";
  };
};
    libinput.enable = true;
    clight.enable = false;
    geoclue2.enable = true;
  };
}
