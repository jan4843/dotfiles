alias py='python3'
alias pip='pip3'
alias pipr='pip install -r requirements.txt'
alias pyserve='python -m SimpleHTTPServer'

venv() {
	[[ -d venv ]] || python3 -m venv venv
	source venv/bin/activate
}
