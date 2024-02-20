{ config, pkgs, lib, ... }:

{
  
  services = {
    xserver = {
      enable = true;
      videoDrivers = lib.mkDefault ["nvidia"];

      displayManager.sddm.enable = true;

      desktopManager.plasma5.enable = true;

      layout = "us";
      xkbVariant = "";
    };

    printing.enable = true;
  };

}
