export EDITOR=vim

if type code > /dev/null 2>&1; then
	if [ -z "$SSH_CONNECTION" ] || [ "$TERM_PROGRAM" = vscode ]; then
		export EDITOR="code --wait"	
	fi
fi

export VISUAL=$EDITOR
