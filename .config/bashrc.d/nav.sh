nav() {
	if [[ $2 == *":"* ]]; then
		local dir
		if [[ $# -gt 2 ]]; then
			dir="$1/$3"
		else
			dir="$1/$(basename "$2" .git)"
		fi
		git clone "$2" "$dir" && cd "$dir"
		rmdir "$dir" 2> /dev/null
	else
		cd "$1/$2"
	fi
}

_nav() {
	mapfile -t COMPREPLY < <(
		cd "$1" 2> /dev/null || exit 1
		compgen -S / -d -- "${COMP_WORDS[COMP_CWORD]}"
	)
	compopt -o nospace
}

dev() { nav ~/Developer "$@"; }
_dev() { _nav ~/Developer; }
complete -F _dev dev

doc() { nav ~/Documents "$@"; }
_doc() { _nav ~/Documents; }
complete -F _doc doc

dt() { nav ~/Desktop "$@"; }
_dt() { _nav ~/Desktop; }
complete -F _dt dt

dl() { nav ~/Downloads "$@"; }
_dl() { _nav ~/Downloads; }
complete -F _dl dl

opt() { nav /opt "$@"; }
_opt() { _nav /opt; }
complete -F _opt opt
