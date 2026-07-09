{ ... }: {
  programs.noctalia = {
    enable = true;
    settings = {
      bar.main = {
        position = "left";
        capsule = true;
        # density = "spacious";
        # floating = true;
        scale = 1.1;
        margin_ends = 0;
        start = [ "control-center" "launcher" "clock" "notifications" "clipboard" ];
        center = [ "workspaces" ];
        end = [ "network" "bluetooth" "volume" "brightness" "battery" ];
      };
      # colorSchemes = {
      #   # predefinedScheme = "Noctalia (default)";
      #   predefinedScheme = "Catppuccin";
      # };
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Catppuccin";
      };
      location = {
        auto_locate = true;
      };
      weather = {
        enabled = true;
      };
    };
  };
}
