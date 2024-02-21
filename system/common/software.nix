{ config, pkgs, ... }:

{
  
  environment.systemPackages = with pkgs; [
    
    git
    gcc
    clang
    nnn
    htop
    neofetch
    firefox
    tmux
    python3

    git-crypt

    wget
    curl
    bintools
    unzip
    zip
    p7zip
    unrar

    pciutils
    usbutils

    ripgrep
    fd

    # steam-gamescope
    steam-run
    steam-tui
    steamcmd
    protontricks
    protonup
    mangohud
    goverlay
    gamescope

  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.java.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = true;
  };

}
