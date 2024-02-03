command -v nix > /dev/null || return

export NIX_SHELL_PRESERVE_PROMPT=1

alias nix='history -a; nix'
alias nix-shell='history -a; nix-shell'
