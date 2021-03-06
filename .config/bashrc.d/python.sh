alias pipr='pip install -r requirements.txt'
alias pyserve='python -m SimpleHTTPServer'

venv() {
	[[ -d venv ]] || python3 -m venv venv
	source venv/bin/activate
}
