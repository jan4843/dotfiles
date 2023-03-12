eman() {
	man -w "$@" >/dev/null || return $?

	MANWIDTH=80 MANPAGER='col -b' man "$@" >/tmp/man.txt
	${EDITOR//--wait/} /tmp/man.txt </dev/tty
}

_completion_loader man
complete -F _man eman
