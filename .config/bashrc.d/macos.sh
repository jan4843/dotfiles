if [[ $OSTYPE != darwin* ]]; then
	return
fi

alias dnsflush='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias dsstore_rm='find . -name .DS_Store -type f -exec rm {} \;'
