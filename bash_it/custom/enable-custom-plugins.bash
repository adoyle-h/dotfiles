# shellcheck disable=SC1090
__enable_custom_plugins() {
  local filepath paths SCRIPT_DIR
  SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")

  readarray -t paths < <(sort <(compgen -G "$SCRIPT_DIR/../plugins/enabled/*.bash" || true))

  DOTFILES_DEBUG "To load plugins: ${#paths[@]}"
  for filepath in "${paths[@]}"; do
    DOTFILES_DEBUG "Load custom plugin: $filepath"
    source "$filepath"
  done
}

__enable_custom_plugins
unset -f __enable_custom_plugins