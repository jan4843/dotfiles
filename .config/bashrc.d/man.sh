eman() {
	MANWIDTH=80 MANPAGER='col -bx' man "$@" | $EDITOR -
}

__load_completion man &> /dev/null && complete -F _man eman
