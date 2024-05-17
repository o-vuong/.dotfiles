#!/usr/bin/env bash

# 🅳🅾🆃🅵🅸🅻🅴🆂 (v0.2.468) - <https://dotfiles.io>
# Made with ♥ in London, UK by @wwdseb
# Copyright (c) 2015-2024. All rights reserved
# License: MIT

# 🅿🆈🆃🅷🅾🅽 🅿🅰🆃🅷
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Encoding[:errors] used for stdin/stdout/stderr.
# export PYTHONIOENCODING='UTF-8'

# If set to 1, enables the UTF-8 mode.
# export PYTHONUTF8=1

# 🅿🆈🆃🅷🅾🅽 🅰🅻🅸🅰🆂🅴🆂 - Python aliases
if command -v 'python3' >/dev/null; then
    alias python=python3          # Default python version
	alias p3=python3.12			  # Default python3 version
    # alias python3=python3.11      # Default python3 version
    alias pip=pip3                # Use pip3 as default pip version
    alias py=python               # Shorthand for 'python' command
    alias ipy=ipython             # Shorthand for 'ipython' command
    alias pep8=autopep8           # Use autopep8 as a tool for formatting Python code
    alias pydoc='python -m pydoc' # Shorthand for 'python -m pydoc' command
fi
