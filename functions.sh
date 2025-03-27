#!/usr/bin/env bash

################################################################################
# 🅳🅾🆃🅵🅸🅻🅴🆂
# Script: functions.sh
# Version: 0.2.468
# Author: @wwdseb
# Copyright (c) 2015-2024. All rights reserved
# Description: Script to load custom executable functions
# Website: https://dotfiles.io
# License: MIT
################################################################################

# Function: load_custom_functions
#
# Description:
#   Loads custom executable functions from the specified directory.
#
# Arguments:
#   None
#
# Further Reading:
#   ShellCheck Documentation: https://github.com/koalaman/shellcheck

load_custom_functions() {
  local dir="${HOME}/.dotfiles/functions"
  if [[ ! -d "${dir}" ]]; then
    echo "Warning: Functions directory not found at ${dir}"
    return 1
  fi

  for function in "${dir}"/[!.#]*.sh; do
    if [[ -f "${function}" ]]; then
      # shellcheck source=/dev/null
      source "${function}" || echo "Warning: Failed to source ${function}"
    fi
  done
}

load_custom_functions
