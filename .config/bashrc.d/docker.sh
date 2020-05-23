if ! type docker &>/dev/null; then
	return
fi

export DOCKER_HIDE_LEGACY_COMMANDS=1
export DOCKER_CONFIG=~/.config/docker
