{...}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      theme = "catppuccin_mocha";
      editor = {
        color-modes = true;
        cursorline = true;
        cursor-shape.insert = "bar";
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
      keys = {
        normal = {
          A-x = "extend_to_line_bounds";
          X = ["extend_line_up" "extend_to_line_bounds"];
          space.B = ":sh git blame -L %{cursor_line},+1 %{buffer_name} -p";
        };
        select = {
          A-x = "extend_to_line_bounds";
          X = ["extend_line_up" "extend_to_line_bounds"];
        };
      };
    };

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "alejandra";
            args = [];
          };
        }
        {
          name = "python";
          auto-format = true;
          language-servers = [
            "ty"
            "pyrefly"
            "ruff"
          ];
        }
        {
          name = "typst";
          roots = ["main.typ"];
          auto-format = true;
        }
      ];
      language-server = {
        rust-analyzer.config = {
          check.command = "clippy";
        };
        tinymist.config = {
          formatterMode = "typstyle";
          lint.enabled = true;
          # exportPdf = "onType";
          # typstExtraArgs = ["main.typ"];
          # preview.background.enabled = true;
          # preview.background.args = ["--data-plane-host=127.0.0.1:0" "--invert-colors=never" "--open"];
        };
      };
    };
  };

  home.sessionVariables = {
    GIT_EDITOR = "hx";
    COLORTERM = "truecolor";
  };
}
