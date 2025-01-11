#!/usr/bin/env zsh

# XDG Base Directory Specification
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# Default programs
export EDITOR="$(command -v nvim || command -v vim || command -v vi)"
export VISUAL="$EDITOR"
export PAGER="less"
export BROWSER="$(command -v open)"

# Language
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Colors
export CLICOLOR=1
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# History
export HISTSIZE=50000
export SAVEHIST=10000
export HISTFILE="${HOME}/.zsh_history"
export HISTORY_IGNORE="(ls|cd|pwd|exit|cd ..|history|clear)"

# Less
export LESS="-F -g -i -M -R -S -w -X -z-4"
export LESSHISTFILE="${XDG_STATE_HOME}/less/history"
export LESSKEY="${XDG_CONFIG_HOME}/less/lesskey"
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Man
export MANPATH="/usr/local/man:/usr/local/share/man:/usr/share/man:$MANPATH"
export MANPAGER="less -X"

# Development
export PYTHONDONTWRITEBYTECODE=1  # Prevent Python from writing .pyc files
export VIRTUAL_ENV_DISABLE_PROMPT=1
export NODE_REPL_HISTORY="${XDG_DATA_HOME}/node/repl_history"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export GOPATH="${XDG_DATA_HOME}/go"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"

# FZF
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --info=inline"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"
