alias docker=:
test -e "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" && source "$_"
unalias docker

alias -- -='cd -'
alias ..='cd ..; pwd'
alias \?='echo $?'

.() {
	if [ $# -eq 0 ]; then
		local root
		if root=$(git rev-parse --show-toplevel); then
			cd "$root" && pwd
		fi
	else
		builtin . "$@"
	fi
}

HISTCONTROL=ignoreboth
HISTSIZE=100000

if command -v __git_ps1 > /dev/null; then
	GIT_PS1_SHOWDIRTYSTATE=1
	GIT_PS1_SHOWUNTRACKEDFILES=1
	GIT_PS1_STATESEPARATOR=
else
	alias __git_ps1=':'
fi

PS1='\h:\W$(__git_ps1 "(%s)") \$ '
PS4='+ ${BASH_SOURCE:-}:${FUNCNAME[0]:-}:L${LINENO:-}: '

style_bold=$'\e[1m'
style_dim=$'\e[90m'
style_reset=$'\e[0m'
for p in PS1 PS2 PS4; do
	declare "$p=\[${style_bold}${style_dim}\]${!p}\[${style_reset}\]"
done
