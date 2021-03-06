test -e /usr/local/etc/profile.d/bash_completion.sh && source $_

alias -- -='cd -'
alias ..='cd ..; pwd'
alias \?='echo $?'

HISTCONTROL=ignoreboth

if type __git_ps1 &> /dev/null; then
	GIT_PS1_SHOWDIRTYSTATE=1
	GIT_PS1_SHOWUNTRACKEDFILES=1
	GIT_PS1_STATESEPARATOR=
else
	alias __git_ps1=':'
fi

PS1='\h:\W$(__git_ps1 "(%s)") \$ '

for p in PS1 PS2 PS4; do
	declare "$p=\[\e[90m\]${!p}\[\e[0m\]"
done; unset p
