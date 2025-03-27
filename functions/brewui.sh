#!/bin/bash

brewui() {
	local destination_folder="/Applications"
	local removed_casks=()
	local removed_formulas=()

	for app in "$@"; do
		if brew list --cask | grep -q "^${app}$"; then
			echo "Uninstalling cask: ${app}"
			if brew uninstall --cask --verbose "${app}"; then
				removed_casks+=("${app}")

				local app_path
				app_path=$(brew info --cask "${app}" | grep -m 1 "App: " | cut -d " " -f 2-)
				local app_name
				app_name=$(basename "${app_path}")

				if [ -e "${destination_folder}/${app_name}" ]; then
					rm -fv "${destination_folder}/${app_name}"
				else
					echo "No symlink found to remove: ${app_name}"
				fi
			else
				echo "Failed to uninstall cask: ${app}"
			fi
		elif brew list | grep -q "^${app}$"; then
			echo "Uninstalling formula: ${app}"
			if brew uninstall --verbose "${app}"; then
				removed_formulas+=("${app}")
			else
				echo "Failed to uninstall formula: ${app}"
			fi
		else
			echo "Application not installed: ${app}"
		fi
	done

	echo "Summary:"
	echo "Removed Casks: ${#removed_casks[@]}"
	echo "Removed Formulas: ${#removed_formulas[@]}"

	echo "Updating Brewfile to reflect current state..."
	brew bundle dump --force
}
