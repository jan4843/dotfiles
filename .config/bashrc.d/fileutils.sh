alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias ln='ln -v'
alias mkdir='mkdir -v'
alias rmdir='rmdir -v'
alias chmod='chmod -vv'
alias chown='chown -vv'
alias chgrp='chgrp -vv'

alias -- -x='chmod -x'
alias -- +x='chmod +x'

alias ls='ls -AFhv --color=auto'
[[ $OSTYPE == darwin* ]] && alias ls='ls -AFh -G'
alias ll='ls -l'
