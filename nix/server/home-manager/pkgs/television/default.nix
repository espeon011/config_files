{pkgs, ...}: {
  programs.television = {
    enable = true;
  };

  home.packages = [
    pkgs.nix-search-tv
  ];

  xdg.configFile."television/nix_channels.toml".source = ./nix_channels.toml;
}
