for profile in ~/.config/profile.d/*; do
	[ -e "$profile" ] && . "$profile"
done

[ -z "$PS1" ] && return

for source in ~/.config/"${SHELL##*/}rc.d"/*; do
	[ -e "$source" ] && . "$source"
done
