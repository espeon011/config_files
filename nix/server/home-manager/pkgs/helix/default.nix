{ ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      theme = "catppuccin_mocha";
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
        end-of-line-diagnostics = "hint";
        inline-diagnostics.cursor-line = "error";
      };
    };

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "nixpkgs-fmt";
            args = [ ];
          };
        }
        {
          name = "python";
          auto-format = true;
        }
        {
          name = "typst";
          roots = [ "main.typ" ];
        }
      ];
      language-server = {
        rust-analyzer.config.check.command = "clippy";
      };
    };
  };

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
    GIT_EDITOR = "hx";
    COLORTERM = "truecolor";
  };
}
