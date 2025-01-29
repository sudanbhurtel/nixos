{
  description = "NixOS and HomeManager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager?ref=release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-grub-themes = {
      url = "github:jeslie0/nixos-grub-themes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    overlay-unstable = final: prev: {
      unstable = nixpkgs-unstable.legacyPackages.${prev.system};};
      in
{
    nixosConfigurations.nixpad = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ( { config, pkgs, ...}: { nixpkgs.overlays = [ overlay-unstable ];})
        ./system/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
	    backupFileExtension = "backup";
            users.sdn = import ./home/home.nix;
 };
        }
      ];
    };

  };
}
