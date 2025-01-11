{ ... }: {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
      simplified_ui = true;
      ui.pane_frames.rounded_corners = true;
      keybinds = {
        unbind = [ "Ctrl q" ];
      };
    };
  };
}
