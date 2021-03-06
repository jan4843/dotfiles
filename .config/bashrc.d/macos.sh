[[ $OSTYPE == darwin* ]] || return

alias dnsflush='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
