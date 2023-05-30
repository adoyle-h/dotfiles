git_clone() {
  if [[ -d "$2" ]]; then return 0; fi
  echo "git clone --depth 1 --single-branch $1 $2"
  git clone --depth 1 --single-branch "$1" "$2"
}

github_clone() {
  if [[ $GITHUB_CLONE == http ]]; then
    git_clone "https://github.com/$1.git" "$2"
  elif [[ $GITHUB_CLONE == git ]]; then
    git_clone "git@github.com:$1.git" "$2"
  else
    echo "Invalid GITHUB_CLONE=$GITHUB_CLONE" >&2
    return 2
  fi
}

stderr() {
  echo "$@" >&2
}

throw_err() {
  echo "$1" >&2
  return "${2:-10}"
}

check_cmd() {
  local cmd="$1"
  if l.has_not command "$cmd"; then
    throw_err "$cmd not found"
  fi
}

check_bash() {
  if ! ( $BASH --version | grep bash &>/dev/null ); then
    echo "\$BASH must be a bash. Current is $BASH. Use 'chsh' to change default shell."
    return 11
  fi
}

download_bins() {
  local name target
  for name in "${!DOWNLOADS[@]}"; do
    target="$DOWNLOAD_BIN_DIR/$name"
    if [[ ! -f "$target" ]]; then
      curl -L -o "$target" "${DOWNLOADS[$name]}"
      chmod +x "$target"
    fi
  done
}
