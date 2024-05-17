
# 🅳🅾🆃🅵🅸🅻🅴🆂 (v0.2.468) - <https://dotfiles.io>
# Made with ♥ in London, UK by @wwdseb
# Copyright (c) 2015-2024. All rights reserved
# License: MIT

# mount_read_only: Function to mount a read-only disk image as read-write
mount_read_only() {
  hdiutil attach "$1" -shadow /tmp/"$1".zshadow -noverify
}
