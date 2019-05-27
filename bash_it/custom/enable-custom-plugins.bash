# shellcheck disable=SC1090
__enable_custom_plugins() {
  local filepath paths SCRIPT_DIR
  SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
  paths=( $(sort <(compgen -G "$SCRIPT_DIR/../plugins/enabled/*.bash" || true)) )

  for filepath in "${paths[@]}"; do
    source "$filepath"
  done
}

__enable_custom_plugins

unset __enable_custom_plugins
