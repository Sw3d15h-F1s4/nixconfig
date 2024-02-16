
  home-manager.users.sam = {lib, pkgs, osConfig, ... }: {
    home.packages = with pkgs; [
	vscode
	btop
	discord
	alacritty
	git-crypt
	gnupg
	gh
	gimp
    ];

    home.stateVersion = "23.11";
  };
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
