alias ll='ls -l'
alias ls='ls -1AFhv --color=auto'

if [[ $OSTYPE == darwin* ]]; then
	alias ls='ls -1AFh -G'
fi
