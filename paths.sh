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
# Source constants
source "${HOME}/.dotfiles/lib/constants.sh"

# Function to check if a directory exists in PATH
path_contains() {
    local dir="$1"
    [[ ":$PATH:" == *":$dir:"* ]]
}

# Function to add a directory to PATH if it exists and isn't already included
add_to_path() {
    local dir="$1"
    local prepend="${2:-false}"
    
    if [[ -d "$dir" ]] && ! path_contains "$dir"; then
        if [[ "$prepend" == "true" ]]; then
            export PATH="$dir:$PATH"
        else
            export PATH="$PATH:$dir"
        fi
    fi
}

# Function to load custom paths with error handling
load_custom_paths() {
    local path_dir="${DOTFILES_PATHS}"
    local count=0
    local errors=0

    if [[ ! -d "${path_dir}" ]]; then
        echo "Warning: ${path_dir} does not exist"
        return 1
    fi

    for config in "${path_dir}"/*/**.sh; do
        if [[ -f "${config}" ]]; then
            if source "${config}"; then
                ((count++))
            else
                echo "Error loading ${config}"
                ((errors++))
            fi
        fi
    done

    echo "Loaded ${count} path configurations (${errors} errors)"
}

# Initialize paths
load_custom_paths
