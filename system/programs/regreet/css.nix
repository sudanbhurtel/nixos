{ config, pkgs, ... }: {
  imports = [ ./config.nix ./css.nix ];
  programs.regreet.enable = true;
  };
}