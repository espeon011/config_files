{ pkgs, ... }: {
  fonts.fontconfig.enable = true;

  home.packages = [
    pkgs.mplus-outline-fonts.githubRelease
  ];
}
