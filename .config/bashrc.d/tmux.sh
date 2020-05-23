if ! type tmux &>/dev/null; then
	return
fi

alias tmux='tmux -f ~/.config/tmux/tmux.conf'
