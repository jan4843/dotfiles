export EDITOR=vim

if [ -z "$SSH_CONNECTION" ] && [ -x /usr/local/bin/subl ]; then
	export EDITOR="subl --wait"
	export LC_RMATE=1
elif [ -n "$LC_RMATE" ]; then
	export EDITOR="rmate --wait"
fi

export VISUAL=$EDITOR
