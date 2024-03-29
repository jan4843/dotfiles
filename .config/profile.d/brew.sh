[ -d /opt/homebrew ] || return

export HOMEBREW_PREFIX=/opt/homebrew
export HOMEBREW_CELLAR=$HOMEBREW_PREFIX/Cellar
export HOMEBREW_REPOSITORY=$HOMEBREW_PREFIX
export PATH=$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin${PATH+:$PATH}
export MANPATH=$HOMEBREW_PREFIX/share/man${MANPATH+:$MANPATH}:
export INFOPATH=$HOMEBREW_PREFIX/share/info:${INFOPATH:-}

export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
