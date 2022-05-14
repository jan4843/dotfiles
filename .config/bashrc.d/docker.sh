command -v docker > /dev/null || return

export DOCKER_CONFIG=~/.config/docker

alias @='docker run --rm -it -v "$PWD:/host" -w /host'

alias compose='docker compose'
complete -F _docker_compose compose
