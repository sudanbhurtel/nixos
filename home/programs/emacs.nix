{ config, pkgs, ... }:
{
  services.emacs = {
    enable = true;
    defaultEditor = true;
    client.enable = true;
  };
  programs.emacs = {
    enable = true;
    package = pkgs.emacs29-pgtk;
    extraConfig = ''
      (set-face-attribute 'default nil :font "Iosevka Nerd Font Mono" :height 200)
      (setq make-backup-files nil)
      (setq auto-save-default nil)
      (require 'package)
      (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t) 
      (package-initialize)
    '';
  };
}
