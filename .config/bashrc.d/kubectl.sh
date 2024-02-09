alias k='kubectl'

_completion_loader kubectl
complete -F __start_kubectl k

kc() {
	kubectl config set-context "${2:---current}" --namespace="$1"
	test $# -gt 1 && kubectl config use-context "$2"
}
_kc() {
	readarray -t COMPREPLY < <(
		compgen -W "$(
			kubectl get namespaces --output=jsonpath='{range .items[*].metadata.name}{@}{" "}{end}'
		)" -- "${COMP_WORDS[COMP_CWORD]}"
	)
}
complete -F _kc kc
