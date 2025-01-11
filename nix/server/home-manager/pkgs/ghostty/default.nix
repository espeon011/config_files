{ ... }: {
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
      background-opacity = 0.9;

      font-family = [
        "M PLUS Code Latin 60"
        "M PLUS 1"
      ];
      font-size = 12;

      # Disable font ligature
      font-feature = [
        "-calt"
        "-liga"
        "-dlig"
      ];

      shell-integration-features = "no-cursor";
      cursor-opacity = 0.5;

      window-padding-x = 4;
      window-padding-y = 8;
      window-padding-balance = true;

      keybind = [
        "ctrl+shift+h=goto_split:left"
        "ctrl+shift+j=goto_split:bottom"
        "ctrl+shift+k=goto_split:top"
        "ctrl+shift+l=goto_split:right"
        "alt+d=new_split:right"
        "alt+shift+d=new_split:down"
      ];

      window-theme = "ghostty";
      # window-theme = "dark";
    };
  };
}
