if ! type rbenv &>/dev/null; then
	return
fi

eval "$(rbenv init -)"
