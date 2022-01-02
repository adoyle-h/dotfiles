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

  if [[ "$opt" == '-h' ]]; then
    cat <<EOF
    $0    : List enabled $ts
$0 -a : List all $ts
EOF
  exit
  fi

  if [[ "$opt" == '-a' ]]; then
    find "$DOTFILES_DIR/$ts/" -depth 1 -type f -exec basename {} ".bash" \; | sort | tr '\n' ' '
  else
    find "$ENABLED_DIR" -depth 1 -type l \
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

enable_file() {
  local name=$1
  local weight
  weight=$(get_weight "$t_dir/$name.bash")

  ln -sf "../$ts/$name.bash" "$ENABLED_DIR/$weight---$name.$t.bash"
  echo "$t '$name' enabled, with weight $weight. Please restart shell to take effect."
}

enable_it() {
  # $ts and $t are defined in bin/sub/enable
  readonly t_dir="$DOTFILES_DIR/$ts"

  local name
  for name in "$@"; do
    check_file "$name"
    enable_file "$name"
  done
}
