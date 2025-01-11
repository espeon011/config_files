{ ... }: {
  programs.eza = {
    enable = true;
    # enableAliases = true;
    git = true;
    icons = "auto";
    extraOptions = [
      "--header"
    ];
  };
}
