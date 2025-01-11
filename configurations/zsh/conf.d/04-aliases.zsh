#!/usr/bin/env zsh

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'
alias d='dirs -v'

# List directory contents
alias ls='ls -G'
alias ll='ls -lh'
alias la='ls -lah'
alias l='ls -CF'

# Git shortcuts
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gl='git pull'
alias gp='git push'
alias gs='git status'

# Directory shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dev="cd ~/Development"
alias dot="cd ~/.dotfiles"

# System
alias sudo='sudo '
alias _='sudo'
alias please='sudo'
alias reload='exec $SHELL -l'
alias path='echo -e ${PATH//:/\\n}'

# Utilities
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias grep='grep --color=auto'
alias vi='vim'

# Development
alias py='python3'
alias pip='pip3'
alias node='node'
alias npm='npm'
alias serve='python3 -m http.server'
