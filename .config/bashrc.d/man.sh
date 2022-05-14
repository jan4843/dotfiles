eman() {
	MANWIDTH=80 MANPAGER='col -bx' man "$@" | $EDITOR -
}

_completion_loader man
complete -F _man eman
