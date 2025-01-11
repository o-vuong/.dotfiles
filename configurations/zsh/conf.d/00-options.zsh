#!/usr/bin/env zsh

# Directory
setopt AUTO_CD              # Change directory without cd
setopt AUTO_PUSHD          # Push directory to stack
setopt PUSHD_IGNORE_DUPS   # Don't push duplicate directories
setopt PUSHD_MINUS         # Exchange meaning of + and - for pushd
setopt PUSHD_SILENT        # Don't print directory stack
setopt PUSHD_TO_HOME       # pushd without arguments goes to ~

# Completion
setopt ALWAYS_TO_END       # Move cursor to end of word on full completion
setopt AUTO_LIST           # List choices on ambiguous completion
setopt AUTO_MENU           # Show completion menu on tab press
setopt AUTO_PARAM_SLASH    # Add trailing slash to completed directories
setopt COMPLETE_IN_WORD    # Complete from both ends of word
setopt NO_MENU_COMPLETE    # Don't autoselect first completion entry

# History
setopt EXTENDED_HISTORY          # Save timestamp and duration
setopt HIST_EXPIRE_DUPS_FIRST   # Expire duplicate entries first
setopt HIST_FIND_NO_DUPS        # Don't display duplicates during search
setopt HIST_IGNORE_ALL_DUPS     # Delete old entry if new entry is duplicate
setopt HIST_IGNORE_DUPS         # Don't record if same as previous
setopt HIST_IGNORE_SPACE        # Don't record commands starting with space
setopt HIST_REDUCE_BLANKS       # Remove superfluous blanks
setopt HIST_SAVE_NO_DUPS        # Don't write duplicate entries
setopt HIST_VERIFY             # Show before executing history commands
setopt INC_APPEND_HISTORY      # Add commands as they are typed
setopt SHARE_HISTORY          # Share history between sessions

# Input/Output
setopt CORRECT                # Try to correct command spelling
setopt INTERACTIVE_COMMENTS   # Allow comments in interactive shell
setopt NO_CLOBBER           # Don't overwrite files with >
setopt NO_FLOW_CONTROL      # Disable start/stop characters
setopt PATH_DIRS            # Perform path search even on commands with /
setopt RC_QUOTES           # Allow 'Henry''s Garage' instead of 'Henry'\''s Garage'

# Job Control
setopt AUTO_RESUME          # Resume existing job instead of creating new one
setopt CHECK_JOBS          # Check jobs on exit
setopt LONG_LIST_JOBS      # List jobs in long format
setopt NOTIFY              # Report status of background jobs immediately

# Prompting
setopt PROMPT_SUBST        # Enable parameter expansion in prompts
setopt TRANSIENT_RPROMPT   # Remove rprompt when command is accepted

# ZLE
setopt NO_BEEP             # Don't beep on errors
setopt VI                  # Use vi key bindings
