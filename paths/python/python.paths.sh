#!/usr/bin/env bash

# 🅳🅾🆃🅵🅸🅻🅴🆂 (v0.2.468) - <https://dotfiles.io>
# Made with ♥ in London, UK by @wwdseb
# Copyright (c) 2015-2024. All rights reserved
# License: MIT

# 🅿🆈🆃🅷🅾🅽 🅿🅰🆃🅷
if [[ "${OSTYPE}" == "darwin"* ]]; then
    if [[ -d "/Library/Frameworks/Python.framework/Versions/3.11/bin" ]]; then
        export PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
        export PYTHONHOME="/Library/Frameworks/Python.framework/Versions/3.11"
    fi
elif [[ "${OSTYPE}" == "linux-gnu"* ]]; then
    if [[ -d "/usr/bin/python3.11" ]]; then
        export PATH="/usr/bin:${PATH}"
        export PYTHONHOME="/usr"
    fi
fi

# Encoding[:errors] used for stdin/stdout/stderr.
export PYTHONIOENCODING='UTF-8'

# If set to 1, enables the UTF-8 mode.
export PYTHONUTF8=1

# 🅿🆈🆃🅷🅾🅽 🅰🅻🅸🅰🆂🅴🆂 - Python aliases
if command -v 'python3' >/dev/null; then
    alias python=python3          # Default python version
    alias python3=python3.11      # Default python3 version
    alias py=python               # Shorthand for 'python' command
    alias ipy=ipython             # Shorthand for 'ipython' command
    alias pep8=autopep8           # Use autopep8 as a tool for formatting Python code
    alias pydoc='python -m pydoc' # Shorthand for 'python -m pydoc' command

    # 🆄🆅 🅰🅻🅸🅰🆂🅴🆂 - uv aliases and configurations
    if command -v 'uv' >/dev/null; then
        alias pip='uv pip'        # Use uv as a replacement for pip
        alias venv='uv venv'      # Use uv to create virtual environments
        alias uvinstall='uv pip install'  # Shorthand for uv pip install
        alias uvuninstall='uv pip uninstall'  # Shorthand for uv pip uninstall
        
        # Set UV_SYSTEM_PYTHON to use the system Python
        export UV_SYSTEM_PYTHON=$(which python3)
        
        # Optional: Set UV_CACHE_DIR to a custom location if needed
        # export UV_CACHE_DIR="$HOME/.cache/uv"
    else
        alias pip=pip3            # Use pip3 as default pip version if uv is not available
    fi
fi#!/usr/bin/env bash

# 🅳🅾🆃🅵🅸🅻🅴🆂 (v0.2.468) - <https://dotfiles.io>
# Made with ♥ in London, UK by @wwdseb
# Copyright (c) 2015-2024. All rights reserved
# License: MIT

# 🅿🆈🆃🅷🅾🅽 🅿🅰🆃🅷
if [[ "${OSTYPE}" == "darwin"* ]]; then
    if [[ -d "/Library/Frameworks/Python.framework/Versions/3.11/bin" ]]; then
        export PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
        export PYTHONHOME="/Library/Frameworks/Python.framework/Versions/3.11"
    fi
elif [[ "${OSTYPE}" == "linux-gnu"* ]]; then
    if [[ -d "/usr/bin/python3.11" ]]; then
        export PATH="/usr/bin:${PATH}"
        export PYTHONHOME="/usr"
    fi
fi

# Encoding[:errors] used for stdin/stdout/stderr.
export PYTHONIOENCODING='UTF-8'

# If set to 1, enables the UTF-8 mode.
export PYTHONUTF8=1

# 🅿🆈🆃🅷🅾🅽 🅰🅻🅸🅰🆂🅴🆂 - Python aliases
if command -v 'python3' >/dev/null; then
    alias python=python3          # Default python version
    alias python3=python3.11      # Default python3 version
    alias py=python               # Shorthand for 'python' command
    alias ipy=ipython             # Shorthand for 'ipython' command
    alias pep8=autopep8           # Use autopep8 as a tool for formatting Python code
    alias pydoc='python -m pydoc' # Shorthand for 'python -m pydoc' command

    # 🆄🆅 🅰🅻🅸🅰🆂🅴🆂 - uv aliases and configurations
    if command -v 'uv' >/dev/null; then
        alias pip='uv pip'        # Use uv pip for all pip commands
        alias venv='uv venv'      # Use uv to create virtual environments
        
        # Set UV_SYSTEM_PYTHON to use the system Python
        export UV_SYSTEM_PYTHON=$(which python3)
        
        # Optional: Set UV_CACHE_DIR to a custom location if needed
        # export UV_CACHE_DIR="$HOME/.cache/uv"
    else
        echo "Warning: 'uv' is not installed. Falling back to standard pip. Install uv for improved performance."
        alias pip=pip3            # Use pip3 as default pip version if uv is not available
    fi
fi