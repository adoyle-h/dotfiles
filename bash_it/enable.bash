DOTFILES_DEBUG "Start to load"

if [[ -h "${BASH_SOURCE[0]}" ]]; then
  DOTFILE_DIR=$(dirname "$(readlink "${BASH_SOURCE[0]}")")/..
else
  DOTFILE_DIR=$(dirname "${BASH_SOURCE[0]}")/..
fi

export BASH_IT="$DOTFILE_DIR/deps/bash-it"
export BASH_IT_CUSTOM="$DOTFILE_DIR/bash_it/custom"
export CUSTOM_THEME_DIR="$DOTFILE_DIR/bash_it/themes"

unset -v DOTFILE_DIR

# ~~Lock and Load a custom theme file~~
# Not set BASH_IT_THEME. Use bash_it/plugins/available/prompt.plugin.bash instead.
# export BASH_IT_THEME=

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=false

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
# shellcheck source=/dev/null
source "$BASH_IT/bash_it.sh"

# If _DEBUG not defined, the exit code should be 0.
DOTFILES_DEBUG "Done loaded" || true
