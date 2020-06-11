if ! type tree &>/dev/null; then
	return
fi

alias tree='tree -aCF --dirsfirst -I "*.git"'
