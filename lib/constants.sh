#!/usr/bin/env bash

# Dotfiles version and metadata
export DOTFILES_VERSION='0.2.468'
export DOTFILES_AUTHOR='@wwdseb'
export DOTFILES_WEBSITE='https://dotfiles.io'
export DOTFILES_LICENSE='MIT'

# Directory structure
export DOTFILES_DIR="${HOME}/.dotfiles"
export DOTFILES_LIB="${DOTFILES_DIR}/lib"
export DOTFILES_PATHS="${DOTFILES_DIR}/paths"
export DOTFILES_CONFIG="${DOTFILES_DIR}/configurations"

# System information
export OS_NAME="$(uname)"
export OS_ARCH="$(uname -m)"
export OS_VERSION="$(uname -r)"
export HOSTNAME="$(hostname -f)"
export USER_LANGUAGE="en_GB.UTF-8"

# Default settings
export TERM="xterm-256color"
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"

# Color support
if [[ -x /usr/bin/dircolors ]]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Python settings
export PYTHONIOENCODING='UTF-8'
export PYTHONUTF8=1

# Node.js settings
export NODE_ENV="development"

# Common paths
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
