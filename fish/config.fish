set -gx HOME (realpath $HOME)
set -gx LANG "ja_JP.UTF-8"
set -gx COLORTERM "truecolor"

# homebrew
switch (uname)
case Darwin
    eval (/opt/homebrew/bin/brew shellenv)
case Linux
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end
## llvm
fish_add_path --path "$HOMEBREW_PREFIX/opt/llvm/bin"
set -gx LDFLAGS "-L$HOMEBREW_PREFIX/opt/llvm/lib"
set -gx CPPFLAGS "-I$HOMEBREW_PREFIX/opt/llvm/include"
set -gx LIBCLANG_PATH "$HOMEBREW_PREFIX/opt/llvm/lib"
## uutils-coreutils
fish_add_path --path "$HOMEBREW_PREFIX/opt/uutils-coreutils/libexec/uubin"

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
