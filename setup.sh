#!/usr/bin/env bash

# Exit on error, undefined variables, and pipe failures
set -euo pipefail

# Script constants
DOTFILES_DIR="${HOME}/.dotfiles"
CONFIG_DIR="${DOTFILES_DIR}/configurations"
BACKUP_DIR="${DOTFILES_DIR}/backups/$(date +%Y%m%d_%H%M%S)"

# Create necessary directories
echo "Creating directory structure..."
mkdir -p "${DOTFILES_DIR}/lib"
mkdir -p "${DOTFILES_DIR}/paths"
mkdir -p "${DOTFILES_DIR}/backups"
mkdir -p "${BACKUP_DIR}"

# Backup existing configuration files
backup_if_exists() {
    local file="$1"
    if [[ -f "$file" && ! -L "$file" ]]; then
        echo "Backing up $file..."
        mv "$file" "${BACKUP_DIR}/$(basename "$file")"
    elif [[ -L "$file" ]]; then
        echo "Removing existing symlink $file..."
        rm "$file"
    fi
}

# Create symbolic links
create_symlink() {
    local source="$1"
    local target="$2"
    if [[ -f "$source" ]]; then
        echo "Creating symlink: $target -> $source"
        backup_if_exists "$target"
        ln -sf "$source" "$target"
    fi
}

# Remove .DS_Store files
echo "Cleaning up .DS_Store files..."
find "${DOTFILES_DIR}" -name ".DS_Store" -type f -delete

# Create symbolic links for configuration files
echo "Setting up configuration files..."
create_symlink "${CONFIG_DIR}/zsh/zshrc" "${HOME}/.zshrc"
create_symlink "${CONFIG_DIR}/bash/bashrc" "${HOME}/.bashrc"
create_symlink "${CONFIG_DIR}/vim/vimrc" "${HOME}/.vimrc"
create_symlink "${CONFIG_DIR}/tmux/tmux.conf" "${HOME}/.tmux.conf"
create_symlink "${CONFIG_DIR}/git/gitconfig" "${HOME}/.gitconfig"

# Source the shell configuration
echo "Sourcing shell configuration..."
if [[ -n "${ZSH_VERSION:-}" ]]; then
    source "${HOME}/.zshrc"
elif [[ -n "${BASH_VERSION:-}" ]]; then
    source "${HOME}/.bashrc"
fi

# Install or update Homebrew packages if on macOS
if [[ "$(uname)" == "Darwin" ]] && command -v brew >/dev/null 2>&1; then
    echo "Updating Homebrew packages..."
    brew update
    brew bundle --file="${DOTFILES_DIR}/Brewfile" || true
fi

echo "Setup complete! Please restart your terminal."
