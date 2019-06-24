# shellcheck disable=SC1090
DOTFILES_DEBUG "Start to load"

CUR_DIR=$(dirname "$(readlink "${BASH_SOURCE[0]}")")
source "$CUR_DIR/../deps/dotfiles_l.bash"
source "$CUR_DIR/../deps/colors.bash"
unset -v CUR_DIR

DOTFILES_DEBUG "Done loaded"
