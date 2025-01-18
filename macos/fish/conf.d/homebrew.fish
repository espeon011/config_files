eval (/opt/homebrew/bin/brew shellenv)
set -gx LD_LIBRARY_PATH /opt/homebrew/lib $LD_LIBRARY_PATH
set -gx HOMEBREW_BUNDLE_FILE "$HOME/.config/homebrew/Brewfile"
set -gx HOMEBREW_BUNDLE_DUMP_NO_VSCODE 1
