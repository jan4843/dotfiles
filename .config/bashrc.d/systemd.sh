if ! type systemd &>/dev/null; then
	return
fi

alias sctl='sudo systemctl'
alias jctl='sudo journalctl'

if __load_completion systemctl &>/dev/null; then
	complete -F _systemctl sctl
fi

if __load_completion journalctl &>/dev/null; then
	complete -F _journalctl jctl
fi

export SYSTEMD_PAGER=
