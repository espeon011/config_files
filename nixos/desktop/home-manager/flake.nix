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
  };

  outputs = { nixpkgs, home-manager, zen-browser, ... }:
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
          # Zotero の内部ランタイムであるところの Firefox ESR 140 (2026-10-13 EOL) を許可
          config.permittedInsecurePackages = [
            "firefox-esr-140-bin-unwrapped-140.17.0esr"
          ];
        };

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          zen-browser.homeModules.beta
          ./home.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
