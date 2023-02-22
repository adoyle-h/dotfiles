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

# Reset environment variable PATH.
ONE_PATHS=(
  ~/bin

  # MacOS users notice: /usr/libexec/path_helper will set the PATH.
  # Refer to https://scriptingosx.com/2017/05/where-paths-come-from/
  # Further, Homebrew install Bash at $HOMEBREW_PREFIX/bin/bash, and MacOS default bash is at /bin/bash,

  # /usr/local/bin must before /bin in PATH
  /usr/local/bin
  /usr/local/sbin

  # /opt/homebrew for MacOS ARM arch
  /opt/homebrew/bin
  /opt/homebrew/sbin

  /usr/bin
  /bin
  /usr/sbin
  /sbin

  ONE_REPO_BINS # The path "$ONE_REPO/bin" of each ONE_REPO will fill into PATH
)

# Skip one.bash components
ONE_SKIP_COMPS=()

# User should print the path of one.bash env file
# @param os type
ONE_LINKS_CONF() {
  case "$1_$2" in
    Darwin*) echo "$DOTFILES_DIR"/links/macos.yaml ;;
    Linux*) echo "$DOTFILES_DIR"/links/debian.yaml ;;
  esac
}
