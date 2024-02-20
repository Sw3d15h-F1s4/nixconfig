{ config, pkgs, ... }:

{
  home.username = "sam";
  home.homeDirectory = "/home/sam";
  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);

  programs.home-manager.enable = true;

  imports = [
    ./configs
    ./settings.nix
    ./software.nix
  ];

}
