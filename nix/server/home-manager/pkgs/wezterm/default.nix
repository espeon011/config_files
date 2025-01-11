{ ... }: {
  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ./wezterm.lua;
  };
  # xdg.configFile."wezterm/wezterm.lua".source = ./wezterm.lua;
}
