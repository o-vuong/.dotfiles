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
  for config in "${HOME}"/.dotfiles/paths/[!.#]*/*.sh; do
    # shellcheck source=/dev/null
    source "${config}"
  done
}

load_custom_paths
