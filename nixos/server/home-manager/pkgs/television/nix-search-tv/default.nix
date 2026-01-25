{...}: {
  programs.nix-search-tv = {
    enable = true;
    settings = {
      update_interval = "24h0m0s";
    };
  };

  xdg.configFile."television/cable/nixpkgs.toml".source = ./nixpkgs.toml;
}
