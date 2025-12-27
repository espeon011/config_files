set -gx STARSHIP_CONFIG "$HOME/.config/starship/config.toml"

if status is-interactive
    starship init fish | source
end
