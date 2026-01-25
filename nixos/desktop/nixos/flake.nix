{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
      # follows = "nixos-cosmic/nixpkgs";
    };
    # nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
  };

  outputs = { nixpkgs, ... }: {
    # outputs = { nixpkgs, nixos-cosmic, ... }: {
    nixosConfigurations.kaveh = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # {
        #   nix.settings = {
        #     substituters = [ "https://cosmic.cachix.org/" ];
        #     trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
        #   };
        # }
        # nixos-cosmic.nixosModules.default
        ./configuration.nix
      ];
    };
  };
}
