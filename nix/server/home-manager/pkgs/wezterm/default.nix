{pkgs, ...}: {
  home.packages = [
    pkgs.mplus-outline-fonts.githubRelease
  ];

  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ./wezterm.lua;
  };
}
