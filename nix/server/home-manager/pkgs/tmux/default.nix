{pkgs, ...}: let
  tmux-catppuccin = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "tmux";
    rev = "ba9bd88c98c81f25060f051ed983e40f82fdd3ba";
    hash = "sha256-HegD89d0HUJ7dHKWPkiJCIApPY/yqgYusn7e1LDYS6c=";
  };

  pwd-command = pkgs.writeShellScriptBin "pwd-command" ''
    # pwd-command <current directory>
    cd "$1"
    PAIN_PWD=$(${pkgs.uutils-coreutils}/bin/uutils-realpath . | ${pkgs.sd}/bin/sd "^$HOME" "~")
    echo " $PAIN_PWD"
  '';

  git-branch-command = pkgs.writeShellScriptBin "git-branch-command" ''
    # git-branch-command <current directory>
    cd "$1"
    if ${pkgs.git}/bin/git rev-parse --git-dir >/dev/null 2>&1; then
      echo " ( $(${pkgs.git}/bin/git rev-parse --abbrev-ref HEAD))"
    fi
  '';

  window-title-command = pkgs.writeShellScriptBin "window-title" ''
    # window-title-command <window title> <current proccess name>
    if [ -n "$1" ]; then
      echo "$1"
    else
      echo "$2"
    fi
  '';
in {
  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    baseIndex = 1;
    clock24 = true;
    escapeTime = 1;
    keyMode = "vi";
    customPaneNavigationAndResize = true;
    mouse = true;
    terminal = "tmux-256color";

    extraConfig = ''
      set -g terminal-overrides ",$TERM:Tc"
      set -g renumber-windows on

      set -g status-interval 1
      set -g status-position top

      bind '"' split-window -c '#{pane_current_path}'
      bind '%' split-window -h -c '#{pane_current_path}'

      bind -T copy-mode-vi v   send-keys -X begin-selection
      bind -T copy-mode-vi V   send-keys -X select-line
      bind -T copy-mode-vi C-v send-keys -X rectangle-toggle \; send-keys -X begin-selection
      bind -T copy-mode-vi y   send-keys -X copy-pipe-and-cancel "pbcopy"

      set -g @catppuccin_flavor "mocha" # latte, frappe, macchiato or mocha
      set -g @catppuccin_window_status_style "basic"
      set -g @catppuccin_status_left_separator "█"
      set -g @catppuccin_status_right_separator "█"
      set -g @catppuccin_status_connect_separator "no"

      set -g @catppuccin_window_current_text " #(${window-title-command}/bin/window-title \"#{window_name}\" \"#{pane_current_command}\")"
      set -g @catppuccin_window_text " #(${window-title-command}/bin/window-title \"#{window_name}\" \"#{pane_current_command}\")"

      set -g @catppuccin_session_icon " tmux "
      set -g @catppuccin_session_text " #S"

      set -g status-left-length 100
      set -g status-left "#{E:@catppuccin_status_session} "

      set -g status-right-length 100
      set -g status-right ""
      set -ga status-right "#{E:@catppuccin_status_user}"
      set -ga status-right " #{E:@catppuccin_status_host}"

      set -g pane-border-status bottom
      set -g @catppuccin_pane_border_status "yes"
      set -g @catppuccin_pane_border_style "fg=#{E:@thm_surface_1}" # デフォルトだと明るすぎる
      set -g pane-border-format " #{pane_index}: #(${pwd-command}/bin/pwd-command \"#{pane_current_path}\")#(${git-branch-command}/bin/git-branch-command \"#{pane_current_path}\") "

      run ${tmux-catppuccin}/catppuccin.tmux
    '';
  };
}
