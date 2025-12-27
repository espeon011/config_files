#! /usr/bin/env sh

XDG_CONFIG_HOME="$HOME/.config"
DIR="$(realpath $(dirname $0))"
cd $DIR

# homebrew
rm -rf homebrew && cp -r $XDG_CONFIG_HOME/homebrew ./

# fish
cd fish
rm -rf conf.d && cp -r $XDG_CONFIG_HOME/fish/conf.d ./
cp $XDG_CONFIG_HOME/fish/config.fish ./
rm -rf functions && cp -r $XDG_CONFIG_HOME/fish/functions ./
cd $DIR

# starship
rm -rf starship && cp -r $XDG_CONFIG_HOME/starship ./

# helix
rm -rf helix && cp -r $XDG_CONFIG_HOME/helix ./

# tmux 
rm -rf tmux && cp -r $XDG_CONFIG_HOME/tmux ./

# zellij
rm -rf zellij && cp -r $XDG_CONFIG_HOME/zellij ./

# wezterm
rm -rf wezterm && cp -r $XDG_CONFIG_HOME/wezterm ./

# ghostty
rm -rf ghostty && cp -r $XDG_CONFIG_HOME/ghostty ./
