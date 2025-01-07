{...}: {
  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    baseIndex = 1;
    clock24 = true;
    escapeTime = 1;
    keyMode = "vi";
    mouse = true;
    terminal = "tmux-256color";
    extraConfig = ''
      set-option -g default-terminal "tmux-256color"
      set-option -g terminal-overrides ",$TERM:Tc"
      set-option -g renumber-windows on

      set-option -g status-interval 1

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      bind-key '"' split-window -c '#{pane_current_path}'
      bind-key % split-window -h -c '#{pane_current_path}'

      bind-key -T copy-mode-vi v                send-keys -X begin-selection
      bind-key -T copy-mode-vi V                send-keys -X select-line
      bind-key -T copy-mode-vi C-v      send-keys -X rectangle-toggle \; send-keys -X begin-selection
      bind-key -T copy-mode-vi y                send-keys -X copy-pipe-and-cancel "pbcopy"

      set-option -g status-bg "colour238"
      set-option -g status-fg "colour255"
      set-option -g status-position top
      set-option -g status-justify left
      set-option -g window-status-current-style underscore

      set-option -g status-left-length 50
      set-option -g status-left "#[fg=colour255,bg=colour241] Session:#S #[default] #[fg=colour255,bg=colour238]"

      set-option -g status-right-length 100
      set-option -g status-right "#[fg=colour255,bg=colour241] #(whoami) | #h | %Y-%m-%d(%a) %H:%M "

      set-option -g pane-border-status bottom
      set-option -g pane-border-style fg=colour238
      set-option -g pane-active-border-style fg=colour45
      set-option -g pane-border-format " Pane:#{pane_index} [#{pane_current_path}] #{?#(cd #{pane_current_path}; git rev-parse --git-dir > /dev/null 2>&1; echo $?),,(#(cd #{pane_current_path}; git rev-parse --abbrev-ref HEAD)) }"
    '';
  };
}
