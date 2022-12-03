# shellcheck disable=2034

export DOTFILES_DIR=$HOME/dotfiles

# Filepath to script. If set, use this file as bashrc.
ONE_RC=''
# If true, prints debug message when loading one.bash
ONE_DEBUG=false
# If loaded time greater ONE_DEBUG_SLOW_LOAD (in millisecond), highlight the loaded time.
ONE_DEBUG_SLOW_LOAD=100
# If true, enable Fig (you should install it before enable). https://github.com/withfig/fig
ONE_FIG=false
# If fault error occurred, use the ONE_BASHRC_FO instead of
ONE_BASHRC_FO=''
# If true, all one.bash modules will not be loaded
ONE_NO_MODS=false

ONE_SHARE_BRANCH=develop

# Add external one.bash repos
ONE_REPOS=(
  "$DOTFILES_DIR"
  "$DOTFILES_DIR/secrets"
)

# Skip one.bash components
ONE_SKIP_COMPS=()

# User should print the path of one.bash env file
# @param os type
ONE_LINKS_CONF() {
  case "$1" in
    MacOS) echo "$DOTFILES_DIR"/links/macos.yaml ;;
    Linux) echo "$DOTFILES_DIR"/links/debian.yaml ;;
  esac
}
