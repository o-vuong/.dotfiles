<!-- markdownlint-disable MD033 MD041 MD043 -->

<img
  src="https://kura.pro/dotfiles/v2/images/logos/dotfiles.svg"
  alt="dotfiles logo"
  width="261"
  align="right"
/>

<!-- markdownlint-enable MD033 MD041 -->

# Dotfiles

A modern, efficient dotfiles management system for macOS and Linux.

## Features

- 🚀 Quick and easy setup
- 🔄 Automatic backup of existing configurations
- 📦 Homebrew package management
- 🛠 Modular configuration system
- 🔒 Secure environment variable management
- 🎨 Customizable shell configurations

## Directory Structure

```
.dotfiles/
├── backups/           # Backup directory for existing configs
├── configurations/    # Configuration files for various tools
├── lib/              # Shared libraries and constants
├── paths/            # Path management for different tools
└── Brewfile          # Homebrew package definitions
```

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
```

2. Run the setup script:
```bash
cd ~/.dotfiles && ./setup.sh
```

## What's Included

- Shell configurations (Zsh, Bash)
- Development tools (Vim, TMux, Git)
- Python environment setup
- Node.js environment setup
- Custom aliases and functions
- Path management system

## Customization

1. Environment Variables:
   - Edit `~/.dotfiles/lib/constants.sh`
   - Create `.env` files for sensitive information

2. Path Management:
   - Add new paths in `~/.dotfiles/paths/`
   - Follow the existing structure for consistency

3. Shell Configuration:
   - Zsh: Edit `configurations/zsh/zshrc`
   - Bash: Edit `configurations/bash/bashrc`

## Troubleshooting

1. Path Issues:
   - Run `echo $PATH` to verify paths
   - Check `~/.dotfiles/paths/` for conflicts

2. Homebrew:
   - Run `brew doctor` for diagnostics
   - Update Brewfile with `brew bundle dump`

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

MIT License - see LICENSE file for details

## Changes

- Removed unnecessary .DS_Store files.
- Consolidated tmux configurations.
- Organized scripts by functionality.
- Archived unused configurations.
- Expanded setup script for package installation and symbolic link setup.
