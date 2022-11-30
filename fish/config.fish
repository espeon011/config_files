# homebrew
eval (/opt/homebrew/bin/brew shellenv)

# cargo
fish_add_path --path "$HOME/.cargo/bin"

# llvm
fish_add_path "/opt/homebrew/opt/llvm/bin"
set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"

# for GPG
set -x GPG_TTY (tty)

# man on bat
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

if status is-interactive
    # Commands to run in interactive sessions can go here

    # vi キーバインド
    fish_vi_key_bindings

    # alias
    alias ls='exa '
    alias ll='exa --long --header --icons'
    alias la='exa --long --header --all --icons'
    alias tree='exa --tree --icons'

    # starship
    set -x STARSHIP_CONFIG "$HOME/.config/starship/config.toml"
    starship init fish | source
end
