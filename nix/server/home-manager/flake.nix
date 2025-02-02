{
  description = "Home Manager configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";
    username = (import ./user.nix).name;
  in
    # pkgs = nixpkgs.legacyPackages.${system};
    {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        # inherit pkgs;
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
