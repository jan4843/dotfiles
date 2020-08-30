export DOTFILES_GIT_DIR=~/.local/src/dotfiles.git

_dotfiles_git() {
	git --git-dir="$DOTFILES_GIT_DIR" --work-tree="$HOME" "$@"
}

dotfiles() {
	while read -r file; do
		(cd; _dotfiles_git add --intent-to-add "${file%.gitkeep}")
	done < <(cd; _dotfiles_git ls-files | grep '/\.gitkeep$')

	_dotfiles_git "$@"
}

if type __git_wrap__git_main &>/dev/null || __load_completion git &>/dev/null; then
	complete -o bashdefault -o default -o nospace -F __git_wrap__git_main dotfiles
fi
