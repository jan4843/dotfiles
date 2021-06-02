export EDITOR=vim

if [ -z "$SSH_CONNECTION" ] && type code > /dev/null 2>&1; then
	export EDITOR="code --wait"
	export LC_RMATE=1
elif [ -n "$LC_RMATE" ] && type rmate > /dev/null 2>&1; then
	export EDITOR="rmate --wait"
fi

export VISUAL=$EDITOR
