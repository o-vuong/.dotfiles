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
	for config in "${HOME}"/.dotfiles/configurations/[!.#]*/*.sh; do
		# shellcheck source=/dev/null
		source "${config}"
	done
}

load_custom_configurations
