{ ... }: {
  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        density = "spacious";
        position = "left";
        floating = true;
      };
      colorSchemes = {
        # predefinedScheme = "Noctalia (default)";
        predefinedScheme = "Catppuccin";
      };
    };
  };
}
