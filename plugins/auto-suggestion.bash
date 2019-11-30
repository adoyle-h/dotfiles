cite about-plugin
about-plugin 'auto-suggestion like zsh'

_P_KEYMAP_LOG=$HOME/.keymap/common.log
_P_KEYMAP_JOB_LOG=$HOME/.keymap/job.log

DOTFILES_DEBUG "To load deps/lobash.bash"
# shellcheck source=../deps/lobash.bash
source "$DOTFILES_DIR/deps/lobash.bash"

# shellcheck source=../deps/bash-auto-suggestion/index.bash
source "$DOTFILES_DIR/deps/bash-auto-suggestion/index.bash"
