[[ -e /home/.steamos ]] || return

__steamos_prompt_command() { :; }

for bin in /opt/*/bin/; do
	[ -d "$bin" ] || continue
	export PATH="$bin:$PATH"
done
