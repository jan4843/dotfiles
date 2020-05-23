for profile in ~/.config/profile.d/*; do
	[ -e "$profile" ] && . "$profile"
done

[ -z "$PS1" ] && return

case ${SHELL##*/} in
	bash)
		for source in \
			/usr/share/bash-completion/bash_completion \
			/usr/local/share/bash-completion/bash_completion \
			~/.config/bashrc.d/*
		do
			[ -e "$source" ] && . "$source"
		done
		;;
esac
