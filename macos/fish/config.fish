set -gx HOME (realpath $HOME)
set -gx LANG "ja_JP.UTF-8"
set -gx COLORTERM "truecolor"

# homebrew
eval (/opt/homebrew/bin/brew shellenv)
set -gx LD_LIBRARY_PATH "/opt/homebrew/lib" $LD_LIBRARY_PATH
## llvm
fish_add_path --path "/opt/homebrew/opt/llvm/bin"
set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"
set -gx LIBCLANG_PATH "/opt/homebrew/opt/llvm/lib"

# cargo
fish_add_path --path "$HOME/.cargo/bin"

# gpg
set -gx GPG_TTY (tty)

# default editor
set -gx EDITOR "hx"

# man on bat
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

if status is-interactive
    # Commands to run in interactive sessions can go here

    # vi keybind
    fish_vi_key_bindings

    # starship
    set -gx STARSHIP_CONFIG "$HOME/.config/starship/config.toml"
    starship init fish | source
end
