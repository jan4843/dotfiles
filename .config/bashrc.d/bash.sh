alias docker=:
test -e "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" && source "$_"
unalias docker

alias -- -='cd -'
alias ..='cd ..; pwd'
alias \?='echo $?'

HISTCONTROL=ignoreboth

if command -v __git_ps1 > /dev/null; then
	GIT_PS1_SHOWDIRTYSTATE=1
	GIT_PS1_SHOWUNTRACKEDFILES=1
	GIT_PS1_STATESEPARATOR=
else
	alias __git_ps1=':'
fi

PS1='\h:\W$(__git_ps1 "(%s)") \$ '
PS4='+ ${BASH_SOURCE:-}:${FUNCNAME[0]:-}:L${LINENO:-}: '

for p in PS1 PS2 PS4; do
	declare "$p=\[\e[90m\]${!p}\[\e[0m\]"
done; unset p

term_launch=1
ensure_newline() {
	[ -n "$TMUX" ] && return

	if [[ -n $term_launch ]]; then
		unset term_launch
		return
	fi

	printf '\e[6n'
	IFS=\; read -rsdR
	if [[ ${REPLY#*;} != 1 ]]; then
		printf '\e[7m%%\e[27m\n'
	fi
}

PROMPT_COMMAND="ensure_newline${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
