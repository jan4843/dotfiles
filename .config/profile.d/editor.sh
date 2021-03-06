export EDITOR=vim

if [ -z "$SSH_CONNECTION" ] && type subl > /dev/null 2>&1; then
	export EDITOR="subl --wait"
	export LC_RMATE=1
elif [ -n "$LC_RMATE" ] && type rmate > /dev/null 2>&1; then
	export EDITOR="rmate --wait"
fi

export VISUAL=$EDITOR
