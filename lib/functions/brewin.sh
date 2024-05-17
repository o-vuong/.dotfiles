brewin() {
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
            ln -Fsv "$app_path" "/Applications/$app_name"

            if [ $? -ne 0 ]; then
                echo "Failed to create symlink for $app_name"
                exit 1
            fi
        done
    else
        brew install --verbose "$@"
        echo "Installed formulae: $@"

        if [ $? -ne 0 ]; then
            echo "Failed to install formulae: $@"
            exit 1
        fi
    fi

    if [ $? -ne 0 ]; then
        echo "An error occurred while executing brewin"
        exit 1
    fi
}
