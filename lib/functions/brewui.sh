brewui() {
    local destination_folder="/Applications"
    local app_path

    for package in "$@"; do
        brew_info=$(brew info "$package" 2>/dev/null)
        is_cask=$(echo "$brew_info" | grep -q "From cask" && echo "yes")

        if [ -n "$is_cask" ]; then
            echo "Uninstalling cask: $package"
            app_path=$(brew info --cask "$package" | grep -m 1 "App: " | cut -d " " -f 2-)
            brew uninstall --cask --verbose "$package"
        else
            echo "Uninstalling formula: $package"
            brew uninstall --verbose "$package"
        fi

        if [ -n "$app_path" ] && [ -e "$destination_folder/$(basename "$app_path")" ]; then
            rm -fv "$destination_folder/$(basename "$app_path")"
        else
            echo "No symlink found for the application to remove: $(basename "$app_path")"
        fi
    done
}
