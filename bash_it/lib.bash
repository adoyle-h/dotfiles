# shellcheck disable=SC1090
DOTFILES_DEBUG "Start to load"

has() {
  local condition="$1"
  local value="$2"

  if [[ "$condition" == "not" ]]; then
    shift 1
    ! has "${@}"
    return $?
  fi

  case "$condition" in
    command)
      [[ -x "$(command -v "$value")" ]] && return 0;;
    function)
      [[ $(type -t "$value") == function ]] && return 0;;
    alias)
      [[ $(type -t "$value") == alias ]] && return 0;;
    keyword)
      [[ $(type -t "$value") == keyword ]] && return 0;;
    builtin)
      [[ $(type -t "$value") == builtin ]] && return 0;;
    the)
      type -t "$value"
      return $?
      ;;
  esac > /dev/null

  return 1
}

__no_matched_path() {
  local char=${3:-':'}
  case "${char}${2}${char}" in
    *${char}${1}${char}*) return 1;;
    *) return 0;;
  esac
}

DOTFILES_DEBUG "Done loaded"
