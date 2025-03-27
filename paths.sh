#!/usr/bin/env bash

################################################################################
# 🅳🅾🆃🅵🅸🅻🅴🆂
# Script: paths.sh
# Version: 0.2.468
# Author: @wwdseb
# Copyright (c) 2015-2024. All rights reserved
# Description: Script to manage shell paths
# Website: https://dotfiles.io
# License: MIT
################################################################################

## 🅲🅾🅽🅵🅸🅶🆄🆁🅰🆃🅸🅾🅽🆂
# Function: load_custom_paths
#
# Description:
#   Loads custom shell paths from the specified directory.
#
# Arguments:
#   None
#
# Further Reading:
#   ShellCheck Documentation: https://github.com/koalaman/shellcheck

load_custom_paths() {
  local dir="${HOME}/.dotfiles/paths"
  if [[ ! -d "${dir}" ]]; then
    echo "Warning: Paths directory not found at ${dir}"
    return 1
  fi

  for config in "${dir}"/[!.#]*/*.sh; do
    if [[ -f "${config}" ]]; then
      # shellcheck source=/dev/null
      source "${config}" || echo "Warning: Failed to source ${config}"
    fi
  done
}

load_custom_paths
