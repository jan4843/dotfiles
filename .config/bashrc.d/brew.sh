if ! type brew &>/dev/null; then
	return
fi

alias cask='brew cask'
alias zap='brew cask zap --force'

complete -F _brew_cask cask
complete -F _brew_cask_list zap

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_EMOJI=1
