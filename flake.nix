{
  description = "Sam's NixOS Config";

  # Declare where we want packages from. Match to current NixOS channel version.
  # Also, make sure home-manager uses system packages instead of whatever else.
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  # Outputs are variables that other flakes can use.
  # In this case, nixpkgs for nix and home-manager for home-manager configs.
  outputs = { nixpkgs, home-manager, ... }: 
  let
    system = "x86_64-linux";
    
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };

    lib = nixpkgs.lib;
 
  in {
    # Each entry matches the hostname of the target system.
    nixosConfigurations = {
      sam-laptop = lib.nixosSystem {
        inherit system;

        # Any nix files, like your configuration.nix
        modules = [
          ./system/sam-laptop.nix
        ];
      };
    };

    homeManagerConfigurations = {
      sam = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          ./users/sam
        ];
      };
    };


  };
}
