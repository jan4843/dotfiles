alias +x='chmod +x'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ll='ls -l'
alias ls='ls -1AFh --color=auto'

if [[ $OSTYPE == darwin* ]]; then
	alias ls='ls -1AFh -G'
fi

export LESSHISTFILE=/dev/null
