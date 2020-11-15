export DOTFILES_GIT_DIR=~/.local/src/dotfiles.git

_dotfiles_git() {
	git --git-dir="$DOTFILES_GIT_DIR" --work-tree="$HOME" "$@"
}

dotfiles() {
	(
		cd || true
		_dotfiles_git ls-files |
		grep '/\.gitkeep$' |
		while read -r file; do
			_dotfiles_git add --intent-to-add "${file%.gitkeep}"
		done
	)

	_dotfiles_git "$@"
}

if type __git_wrap__git_main &>/dev/null || __load_completion git &>/dev/null; then
	complete -o bashdefault -o default -o nospace -F __git_wrap__git_main dotfiles
fi
