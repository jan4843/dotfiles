alias py='python3'
alias pip='pip3'
alias pipr='pip install -r requirements.txt'
alias pyserve='python -m SimpleHTTPServer'

venv() {
	if [[ ! -f venv/bin/activate ]]; then
		python3 -m venv venv
	fi
	source venv/bin/activate
}
