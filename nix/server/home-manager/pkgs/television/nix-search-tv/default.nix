{pkgs, ...}: {
  home.packages = [
    pkgs.nix-search-tv
  ];

  xdg.configFile."television/cable/nixpkgs.toml".source = ./nixpkgs.toml;
  xdg.configFile."nix-search-tv/config.json".source = ./config.json;
}
