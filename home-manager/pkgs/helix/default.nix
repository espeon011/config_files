{...}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "kanagawa";
      editor = {
        cursorline = true;
        color-modes = true;
        bufferline = "multiple";
        statusline.right = [
          "diagnostics"
          "version-control"
          "selections"
          "position"
          "file-encoding"
        ];
        indent-guides.render = true;
      };
    };
  };

  home.sessionVariables = {
    EDITOR = "hx";
  };
}