BASH_4_MANPATH="/usr/local/opt/bash/share/man"

__no_matched_path() {
  case ":${2}:" in
    *:${1}:*) return 1;;
    *) return 0;;
  esac
}

if [[ "$(GET_BASH_MAJOR_VERSION)" == 4 ]] && [[ -d "$BASH_4_MANPATH" ]]; then
  if __no_matched_path "$BASH_4_MANPATH" "$MANPATH"; then
    export MANPATH="$BASH_4_MANPATH:$MANPATH"
  fi
fi
