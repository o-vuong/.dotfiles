#!/bin/bash

brewui() {
    # Set the destination folder for applications
    local destination_folder="/Applications"
    local errors=()

    # Iterate over each application passed as an argument
    for app in "$@"; do
        local app_path=""
        local brew_info
        brew_info=$(brew info "${app}" 2>/dev/null)
        local is_cask
        is_cask=$(echo "$brew_info" | grep -q "From cask" && echo "yes")

        if [[ -z ${brew_info} ]]; then
            errors+=("Application not found: ${app}")
            continue
        fi

        if [[ -n ${is_cask} ]]; then
            # Uninstall the cask application
            echo "Uninstalling cask: ${app}"
            app_path=$(brew info --cask "${app}" | grep -m 1 "App: " | cut -d " " -f 2-)
            brew uninstall --cask --verbose "${app}" || errors+=("Failed to uninstall cask: ${app}")
        else
            # Uninstall the formula application
            echo "Uninstalling formula: ${app}"
            brew uninstall --verbose "${app}" || errors+=("Failed to uninstall formula: ${app}")
        fi

        # Remove the symlink from the destination folder if it exists
        if [[ -n ${app_path} ]] && [[ -e "${destination_folder}/$(basename "${app_path}")" ]]; then
            rm -fv "${destination_folder}/$(basename "${app_path}")"
        else
            echo "No symlink found for the application to remove: $(basename "${app_path}")"
        fi
    done

    # Display any errors encountered
    if [[ ${#errors[@]} -ne 0 ]]; then
        echo -e "\033[31mErrors encountered:\033[0m"
        for error in "${errors[@]}"; do
            echo -e "\033[31m$error\033[0m"
        done
    fi
}
