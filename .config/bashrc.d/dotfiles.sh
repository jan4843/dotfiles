alias dotfiles='git --git-dir="$HOME/.local/src/dotfiles.git" --work-tree="$HOME"'

if type __git_wrap__git_main &>/dev/null || __load_completion git &>/dev/null; then
	complete -o bashdefault -o default -o nospace -F __git_wrap__git_main dotfiles
fi
