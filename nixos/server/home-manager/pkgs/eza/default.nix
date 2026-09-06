{...}: {
  programs.eza = {
    enable = true;
    git = true;
    icons = "auto";
    extraOptions = [
      "--header"
      "--group-directories-first"
    ];
  };
}
