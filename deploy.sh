#! /bin/sh

# starship
mkdir -p $HOME/.config/starship
cp -R starship/* $HOME/.config/starship

# fish
mkdir -p $HOME/.config/fish
cp -R fish/* $HOME/.config/fish

# helix
mkdir -p $HOME/.config/helix
cp -R helix/* $HOME/.config/helix

# tmux
mkdir -p $HOME/.config/tmux
cp -R tmux/* $HOME/.config/tmux

#wezterm
mkdir -p $HOME/.config/wezterm
cp -R wezterm/* $HOME/.config/wezterm
