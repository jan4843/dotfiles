if [[ $TERM_PROGRAM == Apple_Terminal ]]; then
	export LC_TERM_PROGRAM=$TERM_PROGRAM
	return
elif [[ $LC_TERM_PROGRAM != Apple_Terminal ]]; then
	return
fi

update_terminal_cwd() {
	local url_path=''
	local i ch hexch #LC_CTYPE=C LC_ALL=
	for ((i=0; i < ${#PWD}; ++i)); do
		ch="${PWD:i:1}"
		if [[ $ch =~ [/._~A-Za-z0-9-] ]]; then
			url_path+="$ch"
		else
			printf -v hexch "%02X" "'$ch"
			url_path+="%${hexch: -2:2}"
		fi
	done
	printf '\e]7;%s\a' "file://$HOSTNAME$url_path"
}

PROMPT_COMMAND="update_terminal_cwd${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

pre_command() {
	[[ -n $pre_command ]] || return
	IFS=';' read -ra commands <<< "$PROMPT_COMMAND"
	for command in "${commands[@]}"; do
		command="${command#"${command%%[![:space:]]*}"}"
		command="${command%"${command##*[![:space:]]}"}"
		if [[ $BASH_COMMAND == "$command" ]]; then
			return 0
		fi
	done
	printf '\e]1;%s\a' "$BASH_COMMAND"
}

trap "pre_command" DEBUG

post_command() {
	printf '\e]1;%s\a' "-${SHELL##*/}"
	pre_command=1
}

PROMPT_COMMAND="post_command${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
