# you can extend the plugable map
readonly -A t_map=(
  [plugin]=plugins
  [completion]=completions
  [alias]=aliases
)

readonly -A default_weight_map=(
  [plugin]=400
  [completion]=600
  [alias]=800
)

# -----------------------------------------------------------------------------

list() {
  readonly opt=${1:-}

  if [[ "$opt" == '-a' ]]; then
    find "$DOTFILES_DIR/$ts/" -maxdepth 1 -type f -exec basename {} ".bash" \; | sort | tr '\n' ' '
  else
    find "$ENABLED_DIR" -maxdepth 1 -type l \
      -name "*---*.$t.bash" \
      -exec basename {} ".$t.bash" \; \
      | sed -E 's/^[[:digit:]]{3}---(.+)$/\1/' \
      | sort \
      | tr '\n' ' '
  fi

  echo ""
}

# -----------------------------------------------------------------------------

get_plugin_path() {
  local name=$1
  compgen -G "$ENABLED_DIR/*---$name.$t.bash" || true
}

disable_plugin() {
  local name=$1
  local filepath
  filepath=$(get_plugin_path "$name")

  if [[ -f "$filepath" ]]; then
    unlink "$filepath"
    echo "$t '$name' disabled. Please restart shell to take effect."
  else
    echo "Warning: Not found enabled $t '$name'" >&2
  fi
}

disable_it() {
  for name in "$@"; do
    disable_plugin "$name"
  done
}

# -----------------------------------------------------------------------------

check_file() {
  local name=$1
  if [[ ! -f "$t_dir/$name.bash" ]]; then
    echo "No found $t '$name'" >&2
    exit 1
  fi
}

get_weight() {
  local weight
  weight=$(head "$1" | grep -Eo '^# BASH_IT_LOAD_PRIORITY: \d{3}$' | grep -Eo '\d{3}' || true)
  if [[ -z "$weight" ]]; then
    echo "${default_weight_map[$t]}"
  else
    echo "$weight"
  fi
}

get_plugin_dirs() {
  declare -n dirs="$1"
  dirs+=( "$DOTFILES_DIR/$ts" )

  local dir
  for dir in "${DOTFILES_PLUGIN_DIRS[@]}" ; do
    dirs+=( "$dir/$ts" )
  done
}

search_plug() {
  local name=$1

  for dir in "${plugin_dirs[@]}" ; do
    if [[ -f "$dir/$name.bash" ]]; then
      echo "$dir/$name.bash"
      return
    fi
  done

  echo ''
}

enable_file() {
  local name=$1
  local filepath=$2
  local weight
  weight=$(get_weight "$filepath")

  ln -sf "$filepath" "$ENABLED_DIR/$weight---$name.$t.bash"
  echo "$t '$name' enabled, with weight $weight. Please restart shell to take effect."
}

enable_it() {
  # $ts and $t are defined in bin/sub/enable
  readonly t_dir="$DOTFILES_DIR/$ts"
  declare -a plugin_dirs=()
  get_plugin_dirs plugin_dirs

  local name filepath

  for name in "$@"; do
    filepath=$(search_plug "$name")

    if [[ -n $filepath ]]; then
      enable_file "$name" "$filepath"
    else
      echo "No found $t '$name'" >&2
      exit 1
    fi
  done
}
