test -n "$LC_PWD" && cd "$_"

if [[ $TERM_PROGRAM == Apple_Terminal ]]; then
	export LC_TERM_PROGRAM=$TERM_PROGRAM
	return
elif [[ $LC_TERM_PROGRAM != Apple_Terminal ]]; then
	return
fi

no_update_terminal_title=1

update_terminal_cwd() {
	unset no_update_terminal_title

	local LC_CTYPE=C LC_COLLATE=C LC_ALL='' LANG=''
	local url_path i ch hexch
	for ((i = 0; i < ${#PWD}; ++i)); do
		ch=${PWD:i:1}
		if [[ $ch =~ [/._~A-Za-z0-9-] ]]; then
			url_path+=$ch
		else
			printf -v hexch "%02X" "'$ch"
			url_path+=%${hexch: -2:2}
		fi
	done
	printf '\e]7;%s\a' "file://$HOSTNAME$url_path"
}

update_terminal_title() {
	[[ -n $1 ]] && return
	[[ $2 = update_terminal ]] && return

	printf '\e]1;%s\a' "${2-$0}"
}

update_terminal() {
	update_terminal_cwd
	update_terminal_title "$no_update_terminal_title"
}

PROMPT_COMMAND="update_terminal${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
trap 'update_terminal_title "$no_update_terminal_title" "$BASH_COMMAND" "$_"' DEBUG
