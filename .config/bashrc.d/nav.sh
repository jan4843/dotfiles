_nav() {
	"$1" 2> /dev/null || return
	mapfile -t COMPREPLY < <(
		compgen -S / -d -- "${COMP_WORDS[COMP_CWORD]}"
	)
	compopt -o nospace
}

dev() { cd ~/Developer/"$1"; }
_dev() { _nav dev; }
complete -F _dev dev

doc() { cd ~/Documents/"$1"; }
_doc() { _nav doc; }
complete -F _doc doc

dt() { cd ~/Desktop/"$1"; }
_dt() { _nav dt; }
complete -F _dt dt

dl() { cd ~/Downloads/"$1"; }
_dl() { _nav dl; }
complete -F _dl dl

opt() { cd /opt/"$1"; }
_opt() { _nav opt; }
complete -F _opt opt
