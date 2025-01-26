{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-programs-sqlite = {
      url = "github:wamserma/flake-programs-sqlite";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, flake-programs-sqlite, ... }:
    let
      hostname = (import ./host.nix).networking.hostName;
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          flake-programs-sqlite.nixosModules.programs-sqlite
          ./configuration.nix
        ];
      };
    };
}
