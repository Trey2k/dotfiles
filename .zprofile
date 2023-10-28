#!/bin/zsh

export PATH=$PATH:$HOME/.local/bin

unsetopt PROMPT_SP

export EDITOR=nvim
export TERMINAL=alacritty
export BROWERS=firefox

# ~/ Clean up
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
export LESSHISTFILE="-"
export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# Go settings
export GOPATH=$HOME/development/go
export PATH=$PATH:$GOPATH/bin

# Start Hyprland
exec Hyprland
