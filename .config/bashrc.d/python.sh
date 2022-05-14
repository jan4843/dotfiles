alias pipr='pip install -r requirements.txt'

venv() {
	[[ -d venv ]] || python3 -m venv venv
	source venv/bin/activate
}
