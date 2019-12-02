plug_check() {
  local dep_cmd=$1
  local suggestion=$2
  local arr
  arr=( $(basename "${BASH_SOURCE[1]}" ".bash" | sed -E 's/^[[:digit:]]{3}---(.+)\.(.+)$/\1 \2/') )
  local name=${arr[0]}
  local t=${arr[1]}

  if dotfiles_l.has_not command thefuck; then
    cat >&2 <<EOF
${YELLOW_ESC}WARNING: You have enabled $t "$name". It requires command "$dep_cmd" but not found.
         You can invoke "a disable $t $name" to disable it.
         Or $suggestion
${RESET_ALL_ESC}
EOF
    return 3
  fi
}

load_enabled() {
  DOTFILES_DEBUG "To load enabled plugs"
  local filepath
  local -a paths

  # Because "<" make it in pipeline, and tty is missing in pipeline. So separate it into two iterations.
  while read -r filepath ; do
    paths+=("$filepath")
  done < <(sort <(compgen -G "$DOTFILES_DIR/enabled/*.bash" || true))

  # Open strict mode
  # set -o errexit
  # set -o nounset
  # set -o pipefail
  # (shopt -p inherit_errexit &>/dev/null) && shopt -s inherit_errexit

  for filepath in "${paths[@]}" ; do
    DOTFILES_DEBUG "To load file: $filepath"
    source "$filepath" || printf "%bFailed to load file '%s', exit code=%s\n%b" "$YELLOW" "$filepath" "$?" "$RESET_ALL"
  done

  # set +o errexit
  # set +o nounset
  # set +o pipefail
  # (shopt -p inherit_errexit &>/dev/null) && shopt -u inherit_errexit
}

load_enabled
unset -f load_enabled
