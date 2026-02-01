set -gx LANG "ja_JP.UTF-8"
fish_add_path --path $HOME/.local/bin

# less
set -gx LESSHISTFILE -

if status is-interactive
    # Commands to run in interactive sessions can go here

    # vi keybind
    fish_vi_key_bindings

    # theme
    yes | fish_config theme choose "Catppuccin Mocha"
end
