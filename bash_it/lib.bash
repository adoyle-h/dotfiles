#!/usr/bin/env bash
# shellcheck disable=SC1090

# For system start up

# debug PATH and MANPATH
# echo path=${PATH}
# echo -e path=${PATH//:/\\n}
# echo MANPATH=${MANPATH}
# echo -e MANPATH=${MANPATH//:/\\n}

# Reset PATH!!! Because /usr/libexec/path_helper is noisy in macos
MAIN_PATHS="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$MAIN_PATHS"
unset -v MAIN_PATHS

# Reset MANPATH!!! Because /usr/libexec/path_helper is noisy in macos
MAIN_MANPATHS="/usr/local/share/man:/usr/share/man"
export MANPATH="$MAIN_MANPATHS"
unset -v MAIN_MANPATHS

# if [[ $PATH != ?(*:)"/usr/local/bin"?(:*) ]]; then
#   export PATH=/usr/local/bin:$PATH
# fi

# if [[ $PATH != ?(*:)"$HOME/bin"?(:*) ]]; then
#   export PATH=$HOME/bin:$PATH
# fi

has() {
  local condition="$1"
  local value="$2"

  if [ "$condition" == "not" ]; then
    shift 1
    ! has "${@}"
    return $?
  fi

  case "$condition" in
    command)
      [[ -x "$(command -v "$value")" ]] && return 0;;
  esac > /dev/null

  return 1
}

GET_BASH_MAJOR_VERSION() {
  "$BASH" --version | sed -r -n 's@.*[(version)|(版本)] ([0-9]{1,})\.[0-9]{1,}\.[0-9]{1,}\(1\)-release.*@\1@p'
}
