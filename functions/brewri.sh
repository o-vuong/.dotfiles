brewri() {
    local source_folder="/Volumes/LaCie/Applications"
    local destination_folder="/Applications"
    local app_path

    if [ ! -d "$source_folder" ] || [ ! -d "$destination_folder" ]; then
        echo "Source or destination folder does not exist."
        return 1
    fi

    brew_info=$(brew info "$1" 2>/dev/null)
    is_cask=$(echo "$brew_info" | grep -q "From cask" && echo "yes")

    if [ -n "$is_cask" ]; then
        echo "Reinstalling cask: $1"
        brew reinstall --cask --verbose "$1"
        app_path=$(brew info --cask "$1" | grep -m 1 "App: " | cut -d " " -f 2-)
    else
        echo "Reinstalling formula: $1"
        brew reinstall --verbose "$1"
    fi

    if [ -n "$app_path" ] && [ -e "$app_path" ]; then
        ln -Fsv "$app_path" "$destination_folder"
    else
        echo "App path does not exist for the reinstalled application: $app_path"
    fi
}