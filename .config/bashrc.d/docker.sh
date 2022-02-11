command -v docker > /dev/null || return

[[ $OSTYPE == darwin* ]] || return

docker() {
    if [ -n "$DOCKER_HOST" ] || [ -e ~/Library/Containers/com.docker.docker/Data/tasks/docker ]; then
        command docker "$@"
        return
    fi

    open -a Docker
    while ! command docker version > /dev/null 2>&1; do
        sleep 1
    done
    command docker "$@"
}
