# You can invoke "a debug open" to set DOTFILES_DEBUG=on. And "a debug close" to unset.
if [[ $DOTFILES_DEBUG == on ]]; then
  dotfiles_debug() {
    local ts fmt
    ts=$(date +"%Y%m%d_%H%M%S")

    if (( $# > 1 )); then
      fmt="$GREY%s${RESET_ALL} $1\n"
      shift 1
    else
      fmt="$GREY%s${RESET_ALL} %s\n"
    fi

    if true; then
      # Only filename
      tag="[$ts $(basename "${BASH_SOURCE[1]}")]"
    else
      # Full filepath
      tag="[$ts ${BASH_SOURCE[1]}]"
    fi

    # shellcheck disable=SC2059
    printf "$fmt" "$tag" "$@"

    return 0
  }
else
  dotfiles_debug() { return 0; }
fi
