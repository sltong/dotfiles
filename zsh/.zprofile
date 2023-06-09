#!/bin/zsh
LOCALE_ARCHIVE=$HOME/.nix-profile/lib/locale/locale-archive
source ~/.nix-profile/bin
NIX_PATH=$HOME/.nix-defexpr/channels:${NIX_PATH:+:$NIX_PATH}
export XDG_DATA_DIRS=$HOME/.nix-profile/share:$XDG_DATA_DIRS
export PATH="$PATH:/usr/lib/dart/bin"
