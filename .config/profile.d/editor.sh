export EDITOR=vim

if command -v code > /dev/null; then
	if [ -z "$SSH_CONNECTION" ] || [ "$TERM_PROGRAM" = vscode ]; then
		export EDITOR="code --wait"	
	fi
fi

export VISUAL=$EDITOR
