[[ $OSTYPE == darwin* ]] || return

while read -r path; do
	: "${path#/Applications/}"
	app=${_%.app*}
	bin=${path##*/}

	# shellcheck disable=SC2139
	alias "${bin}=open -na \"${app}.app\" --args" 
done < <(printf '%s\n' /Applications/*/Contents/jbr/../MacOS/*)
