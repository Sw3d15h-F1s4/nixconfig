{ config, pkgs, ... } :

{
  imports = [
    ./neovim.nix
    ./kitty.nix
    ./vscode.nix
  ];
}
