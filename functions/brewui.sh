brewui() {
    local destination_folder="/Applications"
    local app_path

    brew_info=$(brew info "$1" 2>/dev/null)
    is_cask=$(echo "$brew_info" | grep -q "From cask" && echo "yes")

    if [ -n "$is_cask" ]; then
        echo "Uninstalling cask: $1"
        app_path=$(brew info --cask "$1" | grep -m 1 "App: " | cut -d " " -f 2-)
        brew uninstall --cask --verbose "$1"
    else
        echo "Uninstalling formula: $1"
        brew uninstall --verbose "$1"
    fi

    if [ -n "$app_path" ] && [ -e "$destination_folder/$(basename "$app_path")" ]; then
        rm -fv "$destination_folder/$(basename "$app_path")"
    else
        echo "No symlink found for the application to remove: $(basename "$app_path")"
    fi
}