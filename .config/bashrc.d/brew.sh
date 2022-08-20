command -v brew > /dev/null || return

alias zap='brew uninstall --zap --force'
complete -F __brew_complete_installed_casks zap
