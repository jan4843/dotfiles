if [[ $OSTYPE != darwin* ]]; then
	return
fi

alias dnsflush='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
