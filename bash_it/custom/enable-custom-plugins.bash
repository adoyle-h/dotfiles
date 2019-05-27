# shellcheck disable=SC1090
__enable_custom_plugins() {
  local filepath
  # read -ra paths < $(sort <(compgen -G "$DOTFILE_DIR/bash_it/plugins/enabled/*.bash"))
  local paths
  paths=( $(sort <(compgen -G "$DOTFILE_DIR/bash_it/plugins/enabled/*.bash" || true)) )

  for filepath in "${paths[@]}"; do
    source "$filepath"
  done
}

__enable_custom_plugins

unset __enable_custom_plugins
