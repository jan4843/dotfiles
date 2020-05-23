alias sudo='sudo '

export SUDO_EDITOR=$EDITOR

sudof() {
	local function command
	function=$1
	command=$(printf '%q ' "$@")
	sudo bash -c "$(declare -f "$function"); $command"
}
