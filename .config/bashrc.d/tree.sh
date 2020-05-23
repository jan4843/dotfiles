if ! type tree &>/dev/null; then
	return
fi

alias tree='tree -C -I "$(test -e ~/.config/tree/ignore && paste -d \| -s $_)"'
