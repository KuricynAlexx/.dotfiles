{
  description = "My first flake";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, home-manager, ... }@inputs:
    let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    nixosConfigurations = {
      snore = lib.nixosSystem {
	inherit system;
	modules = [ ./configuration.nix ];
      };
    };
    homeConfigurations = {
      alex = home-manager.lib.homeManagerConfiguration {
        # inherit system;
	inherit pkgs;
	modules = [ ./home.nix ];
      };
    };
  };
}
