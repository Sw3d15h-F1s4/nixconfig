{ config, pkgs, ... } :

{
  imports = [
    ./neovim.nix
    ./alacritty.nix
  ];
}
