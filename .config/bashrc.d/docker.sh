command -v docker >/dev/null || return

alias compose='docker compose'
_completion_loader docker-compose
complete -F _docker_compose compose

upd() {
	docker compose config --quiet || return
	docker compose down
	start=$(date -Iseconds)
	docker compose up --detach
	docker compose logs --follow --since="$start"
}

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

_shelldocker() {
	local containers
	containers=$(
		docker container ls --format '{{.Names}}'
	)
	mapfile -t COMPREPLY < <(
		compgen -W "$containers" -- "${COMP_WORDS[COMP_CWORD]}"
	)
}
complete -F _shelldocker $
