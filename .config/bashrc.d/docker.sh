command -v docker >/dev/null || return

alias compose='docker compose'
_completion_loader docker-compose
complete -F _docker_compose compose

_heredocker() {
	local images
	images=$(
		docker image ls --format "{{.Repository}}:{{.Tag}}" |
		grep -v '<none>' |
		sed 's/:latest$//'
	)
	mapfile -t COMPREPLY < <(
		compgen -W "$images" -- "${COMP_WORDS[COMP_CWORD]}"
		compgen -d -- "${COMP_WORDS[COMP_CWORD]}"
	)
}
complete -F _heredocker @
