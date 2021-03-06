for f in ~/.config/profile.d/*; do
	. "$f"
done; unset f

test -n "$PS1" || return

if [ -n "$BASH" ]; then
	for f in ~/.config/bashrc.d/*; do
		. "$f"
	done; unset f
fi
