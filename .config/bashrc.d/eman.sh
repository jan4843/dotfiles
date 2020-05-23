eman() {
	(
		MANWIDTH=80 MANPAGER='col -bx' man "$@" |
			edit - &
	) 2> /dev/null
}

if __load_completion man &>/dev/null; then
	complete -F _man eman
fi
