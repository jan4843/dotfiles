command -v apt-get > /dev/null || return

export DEBIAN_FRONTEND=noninteractive
export NEEDRESTART_SUSPEND=1
