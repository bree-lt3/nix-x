{
  description = "NixOS Config Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  outputs = { self, nixpkgs, ... } @ inputs:
    let

    in
    {
     nixosConfigurations = {
	gehenna = import ./hosts/gehenna { inherit inputs; };
        utero   = import ./hosts/utero { inherit inputs; };
      };
    };
}
