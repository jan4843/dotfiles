shopt -s autocd

alias \?='echo $?'

if [[ $TERM_PROGRAM == Apple_Terminal ]]; then
	rm -rf ~/.bash_sessions

	shell_session_delete_expired() { return 0; }
	shell_session_history_allowed() { return 0; }
	shell_session_history_check() { return 0; }
	shell_session_history_enable() { return 0; }
	shell_session_save() { return 0; }
	shell_session_save_history() { return 0; }
	shell_session_update() { return 0; }
fi

mkdir -p ~/.cache/bash

HISTCONTROL=ignoreboth
HISTFILE=~/.cache/bash/history
HISTSIZE=1000
HISTTIMEFORMAT='%F %T '

if type __git_ps1 &>/dev/null; then
	GIT_PS1_SHOWDIRTYSTATE=1
	GIT_PS1_STATESEPARATOR=
else
	alias __git_ps1=':'
fi

PS1='\h:\W$(__git_ps1 "(%s)") \$ '

for prompt in PS{1,2,4}; do
	declare "$prompt=\[\e[90m\]${!prompt}\[\e[0m\]"
done

term_launch=1
ensure_newline() {
	if [[ -n $term_launch ]]; then
		unset term_launch
		return
	fi

	local cursor
	printf '\e[6n'
	IFS=\; read -sdR -a cursor

	if (( cursor[1] != 1 )); then
		printf '\e[7m%%\e[27m\n'
	fi
}

PROMPT_COMMAND="ensure_newline${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
