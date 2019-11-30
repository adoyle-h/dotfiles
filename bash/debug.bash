export DOTFILES_DEBUG_FILE=${DOTFILES_DEBUG_FILE:-"$HOME/.dotfiles.debug"}

# You can invoke "a debug open" to set .bashrc.debug. And "a debug close" to unset.
if [[ -r "$DOTFILES_DEBUG_FILE" ]]; then
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

