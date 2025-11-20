# flake.nix

{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      userConfig = import ./user.nix;
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      homeConfigurations.${userConfig.username} =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [ ./home.nix ];

          extraSpecialArgs = {
            inherit userConfig;
          };
        };
    };
}
