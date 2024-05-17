
# 🅳🅾🆃🅵🅸🅻🅴🆂 (v0.2.468) - <https://dotfiles.io>
# Made with ♥ in London, UK by @wwdseb
# Copyright (c) 2015-2024. All rights reserved
# License: MIT
# Script: editor.aliases.zsh
# Version: 0.2.468
# Website: https://dotfiles.io

# 🅴🅳🅸🆃🅾🆁 🅰🅻🅸🅰🆂🅴🆂

editors="nano vim vi code gedi notepad++"
for editor in ${editors}; do
  if command -v "${editor}" &>/dev/null; then
    # Edit aliases
    alias e='${editor}'
    alias edit='${editor}'
    alias editor='${editor}'
    alias mate='${editor}'
    alias n='${editor}'
    alias v='${editor}'

    break
  fi
done
