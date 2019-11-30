readonly -A t_map=(
  [completion]=completions
  [plugin]=plugins
  [alias]=aliases
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

  # @TODO sort names
  if [[ "$opt" == '-a' ]]; then
    find "$SCRIPT_DIR/../../$ts/" -d 1 -type f -exec basename {} ".$t.bash" \; | sort | tr '\n' ' '
  else
    # @TODO trim name prefix
    find "$ENABLED_DIR" -d 1 -type l \
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
    echo "$t '$name' disabled"
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
  head "$1" | grep -Eo '^# BASH_IT_LOAD_PRIORITY: \d{3}$' | grep -Eo '\d{3}' || true
}

enable_file() {
  local name=$1
  local default_weight=$2
  local weight
  weight=$(get_weight "$t_dir/$name.bash")
  if [[ -z "$weight" ]]; then
    weight="$default_weight"
  fi

  ln -sf "../$ts/$name.bash" "$ENABLED_DIR/$weight---$name.$t.bash"
  echo "$t '$name' enabled. weight=$weight"
}

enable_it() {
  readonly t_dir="$SCRIPT_DIR/../../$ts"

  local default_weight=$1
  shift 1
  local name
  for name in "$@"; do
    check_file "$name"
    enable_file "$name" "$default_weight"
  done
}
