nav() {
	if [[ $2 == *"://"* ]]; then
		dir="$1/$(basename "$2" .git)"
		git clone "$2" "$dir" && cd "$dir"
		rmdir "$dir" 2> /dev/null
		unset dir
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

dev() { nav ~/Developer "$1"; }
_dev() { _nav ~/Developer; }
complete -F _dev dev

doc() { nav ~/Documents "$1"; }
_doc() { _nav ~/Documents; }
complete -F _doc doc

dt() { nav ~/Desktop "$1"; }
_dt() { _nav ~/Desktop; }
complete -F _dt dt

dl() { nav ~/Downloads "$1"; }
_dl() { _nav ~/Downloads; }
complete -F _dl dl

opt() { nav /opt "$1"; }
_opt() { _nav /opt; }
complete -F _opt opt
