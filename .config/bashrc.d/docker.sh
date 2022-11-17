command -v docker > /dev/null || return

_heredocker() {
	local containers
	containers=$(
		docker image ls --format "{{.Repository}}:{{.Tag}}" |
		grep -v '<none>' |
		sed 's/:latest$//'
	)
	mapfile -t COMPREPLY < <(
		compgen -W "$containers" -- "${COMP_WORDS[COMP_CWORD]}"
		compgen -d -- "${COMP_WORDS[COMP_CWORD]}"
	)
}

alias @='heredocker'
complete -F _heredocker heredocker
complete -F _heredocker @

alias compose='docker compose'
_completion_loader docker-compose
complete -F _docker_compose compose
