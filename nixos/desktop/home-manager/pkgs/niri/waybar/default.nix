{ ... }: {
  programs.waybar = {
    enable = true;
  };

  # TODO: Rewrite to nix specific setting
  xdg.configFile."waybar/config".source = ./config;
  xdg.configFile."waybar/style.css".source = ./style.css;
}
