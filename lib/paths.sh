#!/usr/bin/env bash

################################################################################
# 🅳🅾🆃🅵🅸🅻🅴🆂
# Script: paths.sh
# Version: 0.2.468
# Author: @wwdseb
# Copyright (c) 2015-2024. All rights reserved
# Description: Script to manage shell path configurations
# Website: https://dotzfiles.io
# License: MIT
################################################################################

## 🅿🅰🆃🅷🆂
# Function: load_custom_paths
#
# Description:
#   Loads custom shell path configurations from the specified directory.
#
# Arguments:
#   None
#
# Further Reading:
#   ShellCheck Documentation: https://github.com/koalaman/shellcheck

load_custom_paths() {
  for path_config in "${HOME}"/.dotfiles/lib/paths/[!.#]*/*.sh; do
    # shellcheck source=/dev/null
    source "${path_config}"
  done
}

load_custom_paths
