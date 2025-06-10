{pkgs, ...}: {
  home.packages = [
    pkgs.nix-search-tv
  ];

  xdg.configFile."television/nix_channels.toml".source = ./nix_channels.toml;
  xdg.configFile."nix-search-tv/config.json".source = ./config.json;
}
