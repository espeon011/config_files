set -gx LANG "ja_JP.UTF-8"

# man on bat
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

if status is-interactive
    # Commands to run in interactive sessions can go here

    # vi keybind
    fish_vi_key_bindings

    # theme
    yes | fish_config theme save "Catppuccin Mocha"

    # starship
    set -gx STARSHIP_CONFIG "$HOME/.config/starship/config.toml"
    starship init fish | source
end
