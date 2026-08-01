#! /usr/bin/env sh
set -eu

: "${XDG_CONFIG_HOME:=$HOME/.config}"
DIR="$(realpath $(dirname $0))"
cd "$DIR"

sync_config() {
  src="$XDG_CONFIG_HOME/$1"

  if [ ! -d "$src" ]; then
    echo "skip: $1 (not found)" >&2
    return 0
  fi

  rm -rf "./$1"
  cp -r "$src" "./"
  echo "copied: $1"
}

sync_config bash
sync_config blesh
sync_config helix
sync_config kanata
sync_config powershell
sync_config starship
sync_config wezterm
sync_config yazi
sync_config zellij

