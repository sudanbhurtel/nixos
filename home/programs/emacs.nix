{ config, pkgs, ... }:
{
  services.emacs = {
    enable = true;
    defaultEditor = true;
    client.enable = true;
    socketActivation.enable = true;
    startWithUserSession = true;
  };
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraConfig = ''
      (set-face-attribute 'default nil :font "Iosevka Nerd Font Mono" :height 200)
      (setq make-backup-files nil)
      (setq auto-save-default nil)
    '';
  };

}
