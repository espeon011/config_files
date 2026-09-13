{
  description = "Home Manager configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flyline = {
      url = "github:HalFrgrd/flyline";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: let
    system = "x86_64-linux";
    username = (import ./user.nix).name;
  in {
    homeConfigurations.${username} = inputs.home-manager.lib.homeManagerConfiguration {
      # pkgs = nixpkgs.legacyPackages.${system};
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      # Specify your home configuration modules here, for example, the path to your home.nix.
      modules = [
        ./home.nix
      ];

      # Optionally use extraSpecialArgs to pass through arguments to home.nix
      extraSpecialArgs = {inherit inputs;};
    };
  };
}
