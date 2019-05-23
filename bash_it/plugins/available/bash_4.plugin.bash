cite about-plugin
about-plugin 'Settings for bash 4'

BASH_4_MANPATH="/usr/local/opt/bash/share/man"

if [[ "$(GET_BASH_MAJOR_VERSION)" == 4 ]] && [[ -d "$BASH_4_MANPATH" ]]; then
  if __no_matched_path "$BASH_4_MANPATH" "$MANPATH"; then
    export MANPATH="$BASH_4_MANPATH:$MANPATH"
  fi
fi
