for path in \
	~/.local/bin \
	~/.local/bin@local
do
	[ -e "$path" ] && export PATH="$path:$PATH"
done
