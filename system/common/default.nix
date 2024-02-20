{ config, pkgs, ...}:

{
  imports = [
    ./audio.nix
    ./bootloader.nix
    ./desktop.nix
    ./disk.nix
    ./firmware.nix
    ./network.nix
    ./nix.nix
    ./region.nix
    ./shell.nix
    ./software.nix
  ];

  users.users.sam = {
    isNormalUser = true;
    description = "Sam T";
    extraGroups = ["networkmanager" "wheel"];
  };

  system.stateVersion = "23.11";
}
