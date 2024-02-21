{ config, pkgs, ... }:

{
  programs.kitty.enable = true;

  programs.kitty.shellIntegration.enableBashIntegration = true;

  programs.kitty.theme = "Gruvbox Material Dark Hard";

  programs.kitty.font = {
    name = "JetBrainsMono";
    size = 11;
  };

}
