command -v systemd >/dev/null || return

alias s=systemctl
_completion_loader systemctl
complete -F _systemctl s
