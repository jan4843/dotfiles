command -v restic > /dev/null || return

_completion_loader restic
complete -F __start_restic wrestic
