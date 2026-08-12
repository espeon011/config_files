{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
        # to have it up-to-date or simply don't specify the nixpkgs input
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    # noctalia = {
    #   url = "github:noctalia-dev/noctalia";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
  };

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  outputs = { nixpkgs, home-manager, zen-browser, noctalia, ... }:
    let
      system = "x86_64-linux";
      username = (import ./user.nix).name;
    in
    {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        # pkgs = nixpkgs.legacyPackages.${system};
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          zen-browser.homeModules.beta
          noctalia.homeModules.default
          ./home.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
