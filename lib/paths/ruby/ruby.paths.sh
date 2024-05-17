#!/usr/bin/env bash

# 🅳🅾🆃🅵🅸🅻🅴🆂 (v0.2.468) - <https://dotfiles.io>
# Made with ♥ in London, UK by @wwdseb
# Copyright (c) 2015-2024. All rights reserved
# License: MIT

## 🆁🆄🅱🆈 🅷🅾🅼🅴
if [[ "${OSTYPE}" == "darwin"* ]]; then
  if [[ -d "/opt/homebrew/opt/ruby/bin" ]]; then
    RUBY_HOME="/opt/homebrew/opt/ruby/bin"
  fi
elif [[ "${OSTYPE}" == "linux-gnu"* ]]; then
  RUBY_HOME="/usr/lib/ruby/2.7.0/"
fi
export RUBY_HOME
export PATH="${RUBY_HOME}:${PATH}"

## 🅶🅴🅼 🅷🅾🅼🅴
GEM_HOME=$(gem environment gemdir)
GEM_PATH=${GEM_HOME}
export GEM_HOME
export GEM_PATH
export PATH="${GEM_PATH}:${PATH}"
export PATH="${GEM_HOME}:${PATH}"

eval "$(frum init)"