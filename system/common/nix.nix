{ config, pkgs, ...}:

{

  nix = {
    settings.experimental-features = ["nix-command" "flakes"];

    package = pkgs.nixFlakes;
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (pkg: true);
  };

}
