test -n "$LC_PWD" && cd "$_"

if [[ $TERM_PROGRAM == Apple_Terminal ]]; then
	export LC_TERM_PROGRAM=$TERM_PROGRAM
	return
elif [[ $LC_TERM_PROGRAM != Apple_Terminal ]]; then
	return
fi

update_terminal_cwd() {
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
	printf '\e]1;%s\a' "${1-$0}"
}

PROMPT_COMMAND="update_terminal_cwd; update_terminal_title"
trap 'update_terminal_title "$BASH_COMMAND" "$_"' DEBUG
