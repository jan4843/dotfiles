test -e "${ASDF_DIR:-$HOME/.asdf}/asdf.sh" ||
test -e /usr/local/opt/asdf/asdf.sh &&
source "$_"

test -e "${ASDF_DIR:-$HOME/.asdf}/completions/asdf.bash" &&
source "$_"
