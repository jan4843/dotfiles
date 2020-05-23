if ! type brew &>/dev/null; then
	return
fi

alias cask='brew cask'
alias zap='brew cask zap --force'

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_EMOJI=1
