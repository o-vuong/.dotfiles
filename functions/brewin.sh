brewin() {
    source_folder="/Volumes/LaCie/Applications"
    destination_folder="/Applications"

    if [ ! -d "$source_folder" ]; then
        echo "Source folder does not exist: $source_folder"
        return 1
    fi

    if [ ! -d "$destination_folder" ]; then
        echo "Destination folder does not exist: $destination_folder"
        return 1
    fi

    if [[ "$1" == "--cask" ]]; then
        shift
        brew install --cask --verbose "$@"
        echo "Installed casks: $@"

        for cask in "$@"; do
            app_path=$(brew info --cask "$cask" | grep -m 1 "App: " | cut -d " " -f 2-)

            if [ ! -e "$app_path" ]; then
                echo "App path does not exist: $app_path"
                continue
            fi

            app_name=$(basename "$app_path")
            ln -Fsv "$app_path" "$destination_folder/$app_name"
        done
    else
        brew install --verbose "$@"
        echo "Installed formulae: $@"
    fi
}