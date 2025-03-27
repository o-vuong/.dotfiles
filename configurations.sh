#!/usr/bin/env bash

################################################################################
# 🅳🅾🆃🅵🅸🅻🅴🆂
# Script: configurations.sh
# Version: 0.2.468
# Author: @wwdseb
# Copyright (c) 2015-2024. All rights reserved
# Description: Script to manage shell configurations
# Website: https://dotfiles.io
# License: MIT
################################################################################

## 🅲🅾🅽🅵🅸🅶🆄🆁🅰🆃🅸🅾🅽🆂
# Function: load_custom_configurations
#
# Description:
#   Loads custom shell configurations from the specified directory.
#
# Arguments:
#   None
#
# Further Reading:
#   ShellCheck Documentation: https://github.com/koalaman/shellcheck

load_custom_configurations() {
  local dir="${HOME}/.dotfiles/configurations"
  
  # Function to recursively source files
  source_files() {
    local current_dir="$1"
    local file
    
    # Loop through all files and directories
    for file in "${current_dir}"/*; do
      if [[ -f "${file}" ]] && [[ "${file}" =~ \.sh$ ]] && [[ ! "${file}" =~ [.#] ]]; then
        # Source .sh files that don't start with . or #
        # shellcheck source=/dev/null
        source "${file}"
      elif [[ -d "${file}" ]]; then
        # Recursively process subdirectories
        source_files "${file}"
      fi
    done
  }

  # Start recursive sourcing from configurations directory
  source_files "${dir}"
}

load_custom_configurations
