#!/bin/bash

brewin() {
    source_folder="/Volumes/LaCie/Applications"
    destination_folder="/Applications"

    if [ ! -d "${source_folder}" ]; then
        echo "Source folder does not exist: ${source_folder}"
        return 1
    fi

    if [ ! -d "${destination_folder}" ]; then
        echo "Destination folder does not exist: ${destination_folder}"
        return 1
    fi

    for app in "$@"; do
        local brew_info
        brew_info=$(brew info "${app}" 2>/dev/null)

        if [[ -z ${brew_info} ]]; then
            echo "Application not found: ${app}"
            continue
        fi

        if echo "${brew_info}" | grep -q "From cask"; then
            brew install --cask --verbose "${app}"
            echo "Installed cask: ${app}"

            app_path=$(brew info --cask "${app}" | grep -m 1 "App: " | cut -d " " -f 2-)

            if [ ! -e "${app_path}" ]; then
                echo "App path does not exist: ${app_path}"
                continue
            fi

            app_name=$(basename "${app_path}")
            ln -Fsv "${app_path}" "${destination_folder}/${app_name}"
        fi

        if echo "${brew_info}" | grep -q "Formula"; then
            brew install --verbose "${app}"
            echo "Installed formula: ${app}"
        fi
    done
}