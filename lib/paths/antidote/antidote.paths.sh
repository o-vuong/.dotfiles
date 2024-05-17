# # Initialize the completion system
# autoload -Uz compinit
# compinit
# source $HOME/.antidote/antidote.zsh

# # Set the root name of the plugins files (.txt and .zsh) antidote will use.
# zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins

# # Ensure the .zsh_plugins.txt file exists so you can add plugins.
# [[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# # Lazy-load antidote from its functions directory.
# antidote_lazy_load() {
#   fpath=(/.antidote/functions $fpath)
#   autoload -Uz antidote
# }

# # Generate a new static file whenever .zsh_plugins.txt is updated.
# if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
#   antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
# fi

# # Source your static plugins file.
# source ${zsh_plugins}.zsh

# # Dynamically load Antidote
# antidote_dynamic_load() {
#   antidote load
# }

# # Call the functions to lazy load and dynamically load Antidote
# antidote_lazy_load
# antidote_dynamic_load


