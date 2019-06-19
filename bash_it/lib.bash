# shellcheck disable=SC1090
DOTFILES_DEBUG "Start to load"

CUR_DIR=$(dirname "$(readlink "${BASH_SOURCE[0]}")")
source "$CUR_DIR/../pkgs/lobash/src/import.bash"
source "$CUR_DIR/../pkgs/colors.bash"
unset -v CUR_DIR

import has trace_start trace_end str_include start_with trim_start cursor_row now

DOTFILES_DEBUG "Done loaded"
