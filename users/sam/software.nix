{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    vscode
    btop
    discord
    alacritty
    git-crypt
    gnupg
    gh
    gimp
    pinentry-qt
    kicad
    hollywood
    qalculate-qt

    libreoffice-qt
    hunspell
    hunspellDicts.en_US

  ];

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "qt";
  };
} 
