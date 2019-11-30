# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[[ -z "${PS1:-}" ]] && return

# Only execute this file once
[[ -n "${_BASHRC_LOADED:-}" ]] && return
_BASHRC_LOADED=true

if [[ ${BASH_VERSINFO[0]} -lt 4 ]] \
  || ([[ ${BASH_VERSINFO[0]} == 4 ]] && [[ ${BASH_VERSINFO[1]} -lt 4 ]]); then
  cat >&2 <<EOF
Current Bash version ($BASH_VERSION) is not supported. Now use default shell settings.
Please upgrade Bash to 4.4 or higher version. Then restart shell to continue.

For mac user, \`brew install bash\` to install latest version.
EOF
  return
fi

# You can invoke "a debug open" to set .bashrc.debug. And "a debug close" to unset.
if [[ -r "$HOME/.bashrc.debug" ]]; then
  DOTFILES_DEBUG_FLAG=on
  DOTFILES_DEBUG() {
    local ts
    ts=$(date +"%Y%m%d_%H%M%S")

    if true; then
      # Only filename
      echo "[$ts][$(basename "${BASH_SOURCE[1]}")]" "$*"
    else
      # Full filepath
      echo "[$ts][${BASH_SOURCE[1]}]" "$*"
    fi

    return 0
  }
else
  DOTFILES_DEBUG() { return 0; }
  DOTFILES_DEBUG_FLAG=off
fi

# You can invoke "a fast-bashrc open" to set .fast_bashrc. And "a fast-bashrc close" to unset.
DOTFILES_FAST_BASHRC="$HOME/.fast_bashrc"
if [[ -r "$DOTFILES_FAST_BASHRC" ]]; then
  DOTFILES_DEBUG "To load DOTFILES_FAST_BASHRC: ${DOTFILES_FAST_BASHRC}"
  # shellcheck source=./fast_bashrc
  source "$DOTFILES_FAST_BASHRC"
  return
fi

DOTFILES_DEBUG "Start to load main bashrc."

# if [[ -h "${BASH_SOURCE[0]}" ]]; then
#   DOTFILES_DIR=$(dirname "$(readlink "${BASH_SOURCE[0]}")")/..
# else
#   DOTFILES_DIR=$(dirname "${BASH_SOURCE[0]}")/..
# fi

# Fix PATH and MANPATH problems caused by /usr/libexec/path_helper in MacOS.
# Refer to https://scriptingosx.com/2017/05/where-paths-come-from/'
# Secondly, Homebrew install Bash at /usr/local/bin/bash, and MacOS default bash 3 at /bin/bash,
# make sure /usr/local/bin before /bin in PATH
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin"

if [[ $("$DOTFILES_DIR/bin/sub/bash-info") != "$BASH_VERSION" ]]; then
  cat >&2 <<EOF
Please check PATH environment variable. The bash is different from your login shell.
You can invoke "$DOTFILES_DIR/bin/sub/bash-info" and "\`which bash\` --version" to check version.
Now use default shell settings. Please fix your PATH, then restart shell to continue.
EOF
  return
fi

DOTFILES_DEBUG "To load $DOTFILES_DIR/bash/xdg.bash"
# shellcheck source=./xdg.bash
source "$DOTFILES_DIR/bash/xdg.bash"

DOTFILES_DEBUG "To load $DOTFILES_DIR/bash_it/enable.bash"
# shellcheck source=../bash_it/enable.bash
source "$DOTFILES_DIR/bash_it/enable.bash"
