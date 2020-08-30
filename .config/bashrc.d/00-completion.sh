for source in /usr/{local,}/share/bash-completion/bash_completion; do
	[[ -e "$source" ]] && . "$source"
done
