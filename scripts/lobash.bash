# This file is generated by https://github.com/adoyle-h/lobash
# Command: lobash-gen -p 'l.' -m 4.4 lobash.bash
# Author: ADoyle <adoyle.h@gmail.com>
# License: Apache License Version 2.0
# Version: 0.6.0 (69d87b320935228abb6b5d2f3348bed1362b94c3)
# Prefix: l.
# Bash Minimum Version: 4.4
# UNIQ_KEY: 0_6_0_124023316_30179
# Included Modules: array_include array_include.s array_reverse ask ask_input ask_with_cancel basename basename.p benchmark choose compose count_file_lines count_files count_lines.p cur_function_name cursor_col cursor_pos cursor_row date detect_os dirname dirname.p each each.p echo echo.p echo_array echo_screen end_with end_with.s extname extname.p extract first has has.s has_not has_not.s head hex_to_rgb hostname if inc is_array is_array.s is_bash is_bash.s is_dir is_dir.s is_empty_dir is_executable is_executable.s is_executable_file is_executable_file.s is_exported is_falsy is_falsy.s is_file is_file.s is_float is_float.s is_function is_function.s is_gnu_sed is_integer is_integer.s is_link is_link.s is_number is_number.s is_readable is_readable.s is_truthy is_truthy.s is_tty_available is_tty_available.s is_ubuntu is_undefined is_writable is_writable.s join keys last lower_case lower_case.p lower_first lower_first.p match match_list normalize normalize.p not.s not.s.p now now_s parse_params pwd random read_array relative repeat rgb_to_hex sedi seq sleep sort split start_with start_with.s str_include str_include.s str_len str_replace str_replace_all str_replace_last str_size sub term_size trace_count trace_end trace_stack trace_start trace_time trap_error trim trim.p trim_color trim_color.p trim_end trim_end.p trim_start trim_start.p union_array upper_case upper_case.p upper_first upper_first.p with_ifs xdg_config_home

######################## Lobash Internals ########################

_lobash.0_6_0_124023316_30179_detect_os() {
  local kernel_name
  kernel_name="$(uname -s)"

  case "$kernel_name" in
    "Darwin")                         echo MacOS ;;
    "SunOS")                          echo Solaris ;;
    "Haiku")                          echo Haiku ;;
    "MINIX")                          echo MINIX ;;
    "AIX")                            echo AIX ;;
    "IRIX"*)                          echo IRIX ;;
    "FreeMiNT")                       echo FreeMiNT ;;
    "Linux" | "GNU"*)                 echo Linux ;;
    *"BSD" | "DragonFly" | "Bitrig")  echo BSD ;;
    "CYGWIN"* | "MSYS"* | "MINGW"*)   echo Windows ;;
    *)                                echo Unknown_OS "$kernel_name" ;;
  esac
}



[[ -n ${_LOBASH_0_6_0_124023316_30179_INTERNAL_FUNC_PREFIX:-} ]] && return

readonly _LOBASH_0_6_0_124023316_30179_INTERNAL_FUNC_PREFIX=_lobash.
readonly _LOBASH_0_6_0_124023316_30179_INTERNAL_CONST_PREFIX=_LOBASH_
readonly _LOBASH_0_6_0_124023316_30179_PRIVATE_FUNC_PREFIX=_l.
readonly _LOBASH_0_6_0_124023316_30179_PRIVATE_CONST_PREFIX=_L_
readonly _LOBASH_0_6_0_124023316_30179_PUBLIC_FUNC_PREFIX=l.
readonly _LOBASH_0_6_0_124023316_30179_PUBLIC_CONST_PREFIX=L_

readonly _LOBASH_0_6_0_124023316_30179_PREFIX=l.
_LOBASH_0_6_0_124023316_30179_PUBLIC_DEPTH=1  # NOTE: _LOBASH_0_6_0_124023316_30179_PUBLIC_DEPTH should not be readonly
readonly _LOBASH_0_6_0_124023316_30179_MIN_BASHVER=4.4

_LOBASH_0_6_0_124023316_30179_OS=$(_lobash.0_6_0_124023316_30179_detect_os)
readonly _LOBASH_0_6_0_124023316_30179_OS

_lobash.0_6_0_124023316_30179_is_bash() {
  [[ -n "${BASH_VERSION:-}" ]]
}

_lobash.0_6_0_124023316_30179_check_os() {
  if [[ ! $_LOBASH_0_6_0_124023316_30179_OS =~ ^(Linux|MacOS|BSD)$ ]]; then
    echo "Not support current system: $_LOBASH_0_6_0_124023316_30179_OS" >&2
    return 5
  fi
}

_lobash.0_6_0_124023316_30179_check_shell() {
  if ! _lobash.0_6_0_124023316_30179_is_bash; then
    echo 'Lobash only work in Bash.' >&2
    return 6
  fi
}

_lobash.0_6_0_124023316_30179_check_supported_bash_version() {
  local info
  read -r -d '.' -a info <<< "$_LOBASH_0_6_0_124023316_30179_MIN_BASHVER"
  if (( BASH_VERSINFO[0] < info[0] )) \
    || ( (( BASH_VERSINFO[0] == info[0] )) && (( BASH_VERSINFO[1] < info[1] )) ); then
    echo "Bash $BASH_VERSION is not supported. Upgrade your Bash to $_LOBASH_0_6_0_124023316_30179_MIN_BASHVER or higher version." >&2
    return 7
  fi
}

_lobash.0_6_0_124023316_30179_check_support() {
  _lobash.0_6_0_124023316_30179_check_os
  _lobash.0_6_0_124023316_30179_check_shell
  # _lobash.0_6_0_124023316_30179_check_supported_bash_version
}

_lobash.0_6_0_124023316_30179_check_support

_lobash.0_6_0_124023316_30179_dirname() {
  local str=${1:-}
  [[ $str == '/' ]] && echo '/' && return 0
  [[ $str =~ ^'../' ]] && echo '.' && return 0
  [[ ! $str =~ / ]] && echo '.' && return 0

  printf '%s\n' "${str%/*}"
}

_lobash.0_6_0_124023316_30179_with_IFS() {
  local IFS=$1
  shift
  eval "$*"
}

_lobash.0_6_0_124023316_30179_is_tty_available() {
  { : >/dev/tty ; } &>/dev/null
}

_lobash.0_6_0_124023316_30179_is_gnu_sed() {
  local out
  out=$(${1:-sed} --version 2>/dev/null)
  [[ $out =~ 'GNU sed' ]]
}

######################## Module Methods ########################

l.array_include() {
  local _exit_code_
  eval "(( \${#${1}[@]} == 0 )) && _exit_code_=1 || true"
  [[ -n ${_exit_code_:-} ]] && return "$_exit_code_"

  local _e_

  eval "for _e_ in \"\${${1}[@]}\"; do [[ \"\$_e_\" == \"$2\" ]] && _exit_code_=0 && return 0; done"
  [[ -n ${_exit_code_:-} ]] && return "$_exit_code_" || return 1
}

l.array_include.s() {
  local array_name=$1
  local exit_code
  eval "(( \${#${array_name}[@]} == 0 )) && echo false && exit_code=1 || true"
  [[ -n ${exit_code:-} ]] && return 0

  local match="$2"
  local e
  shift

  eval "for e in \"\${${array_name}[@]}\"; do [[ \"\$e\" == \"\$match\" ]] && echo true && exit_code=0 && return 0; done || true"

  [[ -z ${exit_code:-} ]] && echo "false" || return 0
}

l.array_reverse() {
  # shellcheck disable=2034
  local _size_ _idx_
  _size_=$(eval "echo \${#$1[@]}")

  if (( $# > 1 )); then
    eval "for _idx_ in {0..$(( _size_ - 1 ))}; do ${2}[\$(( $(( _size_ - 1 )) - _idx_ ))]=\${${1}[\$_idx_]}; done"
  else
    eval "for _idx_ in {$(( _size_ - 1 ))..0..-1}; do echo \${${1}[\$_idx_]}; done"
  fi
}

_l.0_6_0_124023316_30179_ask() {
  local msg=$1
  local default=$2
  local valid_values prompt
  valid_values="$(l.join values /)"

  if [[ $default == Y ]]; then
    default=yes
    prompt="[$valid_values (default ${default})]"
  elif [[ $default == N ]]; then
    default=no
    prompt="[$valid_values (default ${default})]"
  elif [[ $default == '' ]]; then
    prompt="[$valid_values]"
  else
    echo "Invalid argument 'default'. Valid value is $valid_values. Current=${default}" >&2
    return 3
  fi

  local answer result='' tty_available
  tty_available=$(_lobash.0_6_0_124023316_30179_is_tty_available && echo true || echo false)
  [[ $tty_available == true ]] && echo "$msg" > /dev/tty

  while [[ -z $result ]]; do
    read -rp "$prompt " answer

    if [[ -z $answer ]]; then
      if [[ -z $default ]]; then
        [[ $tty_available == true ]] && echo ">> Empty answer is not allowed." > /dev/tty
      else
        result="${default^^}"
      fi
    else
      local v
      for v in "${values[@]}"; do
        if l.start_with "$v" "${answer,,}"; then
          result="${v^^}"
          break
        fi
      done

      if [[ -z $result ]]; then
        [[ $tty_available == true ]] && echo ">> Invalid answer '$answer'." > /dev/tty
      fi
    fi
  done
  echo "$result"
}

l.ask() {
  local values=(yes no)
  _l.0_6_0_124023316_30179_ask "$1" "${2:-}"
}

l.ask_input() {
  local answer prompt
  local default=${2:-}
  if (( $# < 2 )); then
    prompt="${1:-Ask Input:} "
  else
    prompt="${1:-Ask Input:} (Default: $default) "
  fi

  read -rp "$prompt" answer
  printf '%s\n' "${answer:-$default}"
}

l.ask_with_cancel() {
  local values=(yes no cancel)
  _l.0_6_0_124023316_30179_ask "$1" "${2:-}"
}

l.basename() {
  local str=${1:-}
  str="${str%/}"
  printf '%s\n' "${str##*/}"
}

l.basename.p() {
  local str
  IFS='' read -r str

  l.basename "$str"
}

_l.0_6_0_124023316_30179_run_benchmark() {
  local c=$1
  local repeats=$2
  local i

  # Run the given command [repeats] times
  for (( i = 1; i <= "$repeats" ; i++ )); do
    $c > /dev/null 2>&1
  done;
}

l.benchmark() {
  local c=$1
  local repeats=${2:-10}

  echo "Benchmarking: Run command '$c' [$repeats] times.";
  echo "============="
  type "$c"
  echo "============="

  time _l.0_6_0_124023316_30179_run_benchmark "$c" "$repeats"

  printf '\n--------------------------\n\n'
}

_l.0_6_0_124023316_30179_choose_prompt() {
  printf '  %s\n' 'No. Item'
  local i
  for i in "${!items[@]}"; do
    printf -- '- %-2d  %s\n' $((i + 1)) "${items[$i]}"
  done

  printf 'Please enter the number to choose: \n'
}

l.choose() {
  local items=("$@")

  local num prompt
  prompt=$(_l.0_6_0_124023316_30179_choose_prompt)
  read -r -p "$prompt" num

  if ! [[ ${num} =~ ^[0-9]+$ ]]; then
    echo "Must enter an integer. Current: $num">&2
    return 3
  fi

  if [[ $num -gt ${#items[@]} ]] || [[ $num -lt 1 ]]; then
    printf '%s\n' "Invalid choose number: $num" >&2
    return 4
  fi

  printf '%s\n' "${items[$((num - 1))]}"
}

l.compose() {
  local -a last=()
  local f

  for f in "$@"; do
    if [[ $(type -t "$f") == function ]]; then
      if (( ${#last[@]} > 0 )); then
        last=( "$($f "${last[@]}")" )
      else
        last=( "$($f)" )
      fi
    else
      last=( "$f" )
    fi
  done

  printf '%s\n' "${last[@]:-}"
}


l.count_file_lines() {
  wc -l < "$1" | tr -d ' '
}

l.count_files() {
  local files
  # compgen will return 1 when no matched files
  readarray -t files < <(compgen -f "$1"/ || [[ $? == 1 ]])

  printf '%s\n' "${#files[@]}"
}

l.count_lines.p() {
  local count=0
  while read -r -d $'\n' _; do
    ((count+=1))
  done
  printf '%s\n' "$count"
}

l.cur_function_name() {
  # _LOBASH_0_6_0_124023316_30179_PUBLIC_DEPTH=1 in built lobash.bash, and _LOBASH_0_6_0_124023316_30179_PUBLIC_DEPTH=2 in test.
  printf '%s\n' "${FUNCNAME[$_LOBASH_0_6_0_124023316_30179_PUBLIC_DEPTH]}"
}

l.cursor_col() {
  local COL
  IFS=';' read -rsdR -p $'\E[6n' _ COL
  echo "${COL}"
}


l.cursor_pos() {
  local _ROW_ _COL_
  IFS='[;' read -p $'\e[6n' -d R -rs _ _ROW_ _COL_ _;

  if (( $# > 0 )); then
    IFS=' ' read -ra "$1" <<<"$_ROW_ $_COL_"
  else
    printf '%s\n' "$_ROW_" "$_COL_"
  fi
}

l.cursor_row() {
  local ROW
  IFS=';' read -rsdR -p $'\E[6n' ROW _
  # Strip decoration characters <ESC>[
  echo "${ROW#*[}"
}

l.date() {
  # %(datefmt)T : Causes printf to output the date-time string resulting from using datefmt as a
  # format string for strftime(3). The corresponding argument is an integer representing the number
  # of seconds since the epoch. Two special argument values may be used: -1 represents the
  # current time, and -2 represents the time the shell was invoked. If no argument is specified,
  # conversion behaves as if -1 had been given. This is an exception to the usual printf behavior.
  printf "%($1)T\\n" "-1"
}

l.detect_os() {
  _lobash.0_6_0_124023316_30179_detect_os
}

l.dirname() {
  _lobash.0_6_0_124023316_30179_dirname "${1:-}"
}

l.dirname.p() {
  local str
  IFS='' read -r str
  _lobash.0_6_0_124023316_30179_dirname "$str"
}

l.each() {
  # shellcheck disable=2034
  local _key_
  eval "for _key_ in \"\${!$1[@]}\"; do ${2} \"\${$1[\"\$_key_\"]}\" \"\$_key_\"; done"
}

l.each.p() {
  local _i_=0 _l_
  local IFS=$'\n'

  while read -r _l_; do
    $1 "$_l_" "$_i_"
    (( ++_i_ ))
  done
}

l.echo() {
  printf -- '%b\n' "$*"
}

l.echo.p() {
  local _l_
  while read -r _l_; do
    printf -- '%b\n' "$_l_"
  done
}

l.echo_array() {
  eval "printf '%s\\n' \"\${${1}[@]:-}\""
}

l.echo_screen() {
  # /dev/tty may not exist when run in interactive shell
  (printf -- '%b\n' "$*" >/dev/tty || true) 2>/dev/null
}

l.end_with() {
  [[ $1 =~ "$2"$ ]]
}

l.end_with.s() {
  l.end_with "$@" && echo true || echo false
}

l.extname() {
  local path=${1:-}
  [[ $path =~ ^\. ]] && echo '' && return
  [[ ! $path =~ \. ]] && echo '' && return
  echo ".${path##*.}"
}

l.extname.p() {
  local path
  IFS='' read -r path
  l.extname "$path"
}

l.extract() {
  local IFS=$'\n'
  local extract=false

  while read -r line; do
    [[ $extract == true ]] && [[ $line != "$2" ]] && printf '%s\n' "$line"
    [[ $line == "$1" ]] && extract=true
    [[ $line == "$2" ]] && extract=false
  done
}

l.first() {
  local _size_
  _size_=$(eval "echo \${#${1}[@]}")
  if (( _size_ > 0 )); then
    eval "printf '%s\\n' \"\${${1}[@]:0:${2:-1}}\""
  fi
}

l.has() {
  local condition="$1"
  local value="$2"

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
      return $?;;
    *)
      echo "Invalid Condition: $condition" >&2
      return 3;;
  esac > /dev/null

  return 1
}

l.has.s() {
  local condition="$1"
  local value="$2"

  case "$condition" in
    command)
      [[ -x "$(command -v "$value")" ]] && echo true || echo false;;
    function)
      [[ $(type -t "$value") == function ]] && echo true || echo false;;
    alias)
      [[ $(type -t "$value") == alias ]] && echo true || echo false;;
    keyword)
      [[ $(type -t "$value") == keyword ]] && echo true || echo false;;
    builtin)
      [[ $(type -t "$value") == builtin ]] && echo true || echo false;;
    the)
      type -t "$value" >/dev/null && echo true || echo false;;
    *)
      echo "Invalid Condition: $condition" >&2
      return 3;;
  esac
}

l.has_not() {
  local e=false
  [[ $- =~ e ]] && e=true
  set +e
  l.has "${@}"
  local result=$?
  [[ $e == true ]] && set -e

  if [[ $result == 0 ]]; then
    return 1
  elif [[ $result == 1 ]]; then
    return 0
  else
    return $result
  fi
}

l.has_not.s() {
  local r
  r=$(l.has.s "$@")
  l.not.s "$r"
}

l.head() {
  local lines
  mapfile -tn "$1" lines
  printf '%s\n' "${lines[@]}"
}

l.hex_to_rgb() {
  local hex r g b
  hex="${1/\#}"

  if (( ${#hex} == 6 )); then
    ((r=16#${hex:0:2},g=16#${hex:2:2},b=16#${hex:4:2})) || true
  elif (( ${#hex} == 3 )); then
    ((r=16#${hex:0:1}${hex:0:1},g=16#${hex:1:1}${hex:1:1},b=16#${hex:2:1}${hex:2:1})) || true
  else
    echo 'Argument is not a hex.' >&2
    return 3
  fi

  printf '%s\n%s\n%s\n' "$r" "$g" "$b"
}

l.hostname() {
  printf '%s\n' "${HOSTNAME:-$(hostname)}"
}

l.if() {
  local condition
  if [[ $(type -t "$1") == function ]]; then
    condition=$($1)
  else
    condition=$1
  fi

  if [[ $condition == true ]] || [[ $condition == 0 ]]; then
    $2
  elif [[ $condition == false ]] || [[ $condition == 1 ]]; then
    ${3:-}
  else
    echo "Invalid condition: $condition"
    return 3
  fi
}

l.inc() {
  eval "((${1}+=${2:-1})) || true"
}

l.is_array() {
  [[ -z ${1:-} ]] && return 1

  local attrs
  # shellcheck disable=2207
  attrs=$(declare -p "$1" 2>/dev/null | sed -E "s/^declare -([-a-zA-Z]+) .+/\\1/" || true)

  # a: array
  # A: associate array
  if [[ ${attrs} =~ a|A ]]; then return 0; else return 1; fi
}

l.is_array.s() {
  l.is_array "$@" && echo true || echo false
}

l.is_bash() {
  _lobash.0_6_0_124023316_30179_is_bash
}

l.is_bash.s() {
  _lobash.0_6_0_124023316_30179_is_bash && echo true || echo false
}

l.is_dir() {
  [[ -d ${1:-} ]]
}

l.is_dir.s() {
  [[ -d ${1:-} ]] && echo true || echo false
}

l.is_empty_dir() {
  [[ -d ${1:-} ]] && [[ -z $(ls -A "${1:-}") ]]
}

l.is_executable() {
  [[ -x ${1:-} ]]
}

l.is_executable.s() {
  [[ -x ${1:-} ]] && echo true || echo false
}

l.is_executable_file() {
  [[ -z ${1:-} ]] && return 1

  if l.is_dir "$1"; then
    # directory is executable
    # https://superuser.com/a/168583
    return 1
  else
    [[ -x $1 ]]
  fi
}

l.is_executable_file.s() {
  l.is_executable_file "${1:-}" && echo true || echo false
}

l.is_exported() {
  local s
  if s=$(declare -p "$1" 2>/dev/null) ;then
    s=$(echo "$s" | sed -E 's/^declare ([-a-zA-Z]+) .+/\1/')
    if [[ $s == *x* ]]; then
      return 0
    else
      return 1
    fi
  else
    return 1
  fi
}

l.is_falsy() {
  [[ -z ${1:-} ]] && return 1

  if l.is_integer "$1"; then
    [[ $1 != 0 ]]
  else
    [[ $1 == false ]]
  fi
}

l.is_falsy.s() {
  l.is_falsy "${1:-}" && echo true || echo false
}

l.is_file() {
  [[ -f ${1:-} ]]
}

l.is_file.s() {
  [[ -f ${1:-} ]] && echo true || echo false
}

l.is_float() {
  [[ ${1:-} =~ ^[-+]?[0-9]+([.][0-9]+)?$ ]]
}

l.is_float.s() {
  l.is_float "${1:-}" && echo true || echo false
}

l.is_function() {
  [[ $(type -t "${1:-}") == function ]]
}

l.is_function.s() {
  [[ $(type -t "${1:-}") == function ]] && echo true || echo false
}

l.is_gnu_sed() {
  _lobash.0_6_0_124023316_30179_is_gnu_sed
}

l.is_integer() {
  [[ ${1:-} =~ ^[-+]?[0-9]+$ ]]
}

l.is_integer.s() {
  l.is_integer "${1:-}" && echo true || echo false
}

l.is_link() {
  [[ -L ${1:-} ]]
}

l.is_link.s() {
  [[ -L ${1:-} ]] && echo true || echo false
}

l.is_number() {
  [[ ${1:-} =~ ^[-+]?[0-9]+(.[0-9]+)?$ ]]
}

l.is_number.s() {
  l.is_number "${1:-}" && echo true || echo false
}

l.is_readable() {
  [[ -r ${1:-} ]]
}

l.is_readable.s() {
  [[ -r ${1:-} ]] && echo true || echo false
}

l.is_truthy() {
  [[ ${1:-} == true ]] || [[ ${1:-} == 0 ]]
}

l.is_truthy.s() {
  l.is_truthy "${1:-}" && echo true || echo false
}

l.is_tty_available() {
  _lobash.0_6_0_124023316_30179_is_tty_available
}

l.is_tty_available.s() {
  _lobash.0_6_0_124023316_30179_is_tty_available && echo true || echo false
}

l.is_ubuntu() {
  if [[ -f /etc/os-release ]]; then
    grep '^NAME="Ubuntu"' </etc/os-release &>/dev/null
  else
    return 1
  fi
}

l.is_undefined() {
  if declare -p "$1" &>/dev/null ;then
    return 1
  else
    return 0
  fi
}

l.is_writable() {
  [[ -w ${1:-} ]]
}

l.is_writable.s() {
  [[ -w ${1:-} ]] && echo true || echo false
}

l.join() {
  if [[ $# == 1 ]]; then
    local IFS=,
  else
    local IFS=${2}
  fi
  eval "printf '%s\\n' \"\${${1}[*]:-}\""
}

l.keys() {
  # shellcheck disable=2034
  local _key_
  eval "for _key_ in \"\${!${1}[@]}\" ; do echo \"\$_key_\"; done"
}

l.last() {
  local _count_=${2:-1}
  local _size_
  _size_=$(eval "echo \${#${1}[@]}")

  if (( _size_ > 0 )); then
    if (( _count_ < _size_ )); then
      eval "printf '%s\\n' \"\${${1}[@]: -${_count_}:${_count_}}\""
    else
      eval "printf '%s\\n' \"\${${1}[@]}\""
    fi
  fi
}


l.lower_case() {
  local str=${1:-}
  printf '%s\n' "${str,,}"
}

l.lower_case.p() {
  local str
  IFS='' read -r str
  l.lower_case "$str"
}

l.lower_first() {
  local str=${1:-}
  printf '%s\n' "${str,}"
}

l.lower_first.p() {
  local str
  IFS='' read -r str
  l.lower_first "$str"
}

l.match() {
  [[ ${3:-} == 0 ]] && echo "index cannot be 0" >&2 && return 3

  if [[ $1 =~ $2 ]]; then
    if (( ${#BASH_REMATCH[@]} > 1 )); then
      printf '%s\n' "${BASH_REMATCH[${3:-1}]}"
    else
      echo ''
    fi
  else
    echo ''
  fi
}

l.match_list() {
  (( $# != 3 )) && echo "wrong parameters" >&2 && return 3

  if [[ $1 =~ $2 ]]; then
    local _len_=${#BASH_REMATCH[@]}
    local _i_
    if (( _len_ > 1 )); then
      for (( _i_ = 1; _i_ < _len_; _i_++ )); do
        eval "${3}+=( \"\${BASH_REMATCH[$_i_]}\" )"
      done
    fi
  fi
}

l.normalize() {
  local path=${1:-}

  if [[ -z ${path} ]]; then
    echo '.'
    return 0
  fi

  if [[ ${path} == '.' ]]; then
    echo '.'
    return 0
  fi

  local -a words
  l.split "$path" words '/'
  local -a list=()
  local -a pre_list=()
  local n=0
  local i

  if [[ ${path:0:1} == '/' ]]; then
    pre_list+=(/)
  else
    for i in "${words[@]}"; do
      if [[ $i =~ ^'.' ]]; then
        ((n+=1))
        pre_list+=("$i")
      else
        break
      fi
    done
  fi

  for (( ; n < ${#words[@]}; n++ )); do
    i=${words[$n]}
    if [[ $i == '' ]] || [[ $i == '.' ]]; then
      true
    elif [[ $i == '..' ]]; then
      local k=$(( ${#list[@]} - 1)) || true
      [[ $k > -1 ]] && unset list["$k"]
    else
      list+=("$i")
    fi
  done

  printf '%s%s\n' "$(l.join pre_list '/')" "$(l.join list '/')"
}

l.normalize.p() {
  local path
  IFS='' read -r path
  l.normalize "$path"
}

l.not.s() {
  local condition="${1:-}"

  if [[ $condition == true ]]; then
    echo false;
  elif [[ $condition == false ]]; then
    echo true
  else
    echo "Invalid condition! It must be one of 'true' and 'false'. Current value=$condition" >&2
    return 3
  fi
}

l.not.s.p() {
  local condition
  read -r condition
  l.not.s "$condition"
}

if (( BASH_VERSINFO[0] > 4 )); then
  # EPOCHREALTIME is supported since Bash 5.0
  l.now() {
    echo $(( ${EPOCHREALTIME/./} / 1000 ))
  }
else
  _l.0_6_0_124023316_30179_perl_now() {
    perl -MTime::HiRes=time -e 'printf "%d\n", time * 1000'
  }

  l.now() {
    local timestamp

    if [[ $_LOBASH_0_6_0_124023316_30179_OS == 'MacOS' ]]; then
      # date '+%N' not supported in MacOS.
      _l.0_6_0_124023316_30179_perl_now
    else
      # Some Linux systems may not install the Perl module "Time::HiRes".
      # So use date '+%3N' to get milliseconds.
      timestamp=$(date '+%s%3N')

      if [[ ${#timestamp} == 10 ]]; then
        # But the date '+%N' is GNU date feature which not supported in Alpine/Busybox systems.
        _l.0_6_0_124023316_30179_perl_now
      else
        printf '%s\n' "$timestamp"
      fi
    fi
  }
fi

l.now_s() {
  l.date '%s'
}

_l.0_6_0_124023316_30179_parse_single_hyphen_options() {
  local param=${1#-}

  # Possible Formats:
  # -a 3 or -abc 3
  # -a or -a3 or -abc3
  # -a=3 or -abc=3
  # -a= or -abc=

  local -a matches=()
  local k letters

  l.match_list "$param" '^(.+)=(.*)$' matches

  if (( ${#matches[@]} == 2 )); then
    # -a=3 or -abc=3
    # -a= or -abc=
    letters=${matches[0]}
    $add_opt "${letters: -1:1}" "${matches[1]}"

    letters=${letters:0:$(( ${#letters} - 1 ))}
    for (( k = 0; k < ${#letters} ; k++ )); do
      $add_opt "${letters:$k:1}" true
    done
    return
  fi

  if (( $# == 2 )); then
    # -a 3 or -abc 3
    $add_opt "${param: -1:1}" "$2"
    (( i+=1 ))

    letters=${param:0:$(( ${#param} - 1 ))}
    for (( k = 0; k < ${#letters}; k++ )); do
      $add_opt "${letters:$k:1}" true
    done
    return
  else
    # -a or -a3 or -abc3
    for (( k = 0; k < ${#param}; k++ )); do
      $add_opt "${param:$k:1}" true
    done
    return
  fi

  echo "Unknown option: -$param" >&2
  return 4
}

_l.0_6_0_124023316_30179_parse_double_hyphen_options() {
  local param=${1#--}

  local -a matches=()
  l.match_list "$param" '^(.+)=(.*)' matches

  if (( ${#matches[@]} == 2 )); then
    $add_opt "${matches[0]}" "${matches[1]}"
  else
    local key
    key=$(l.match "$param" '^no-(.+)')
    if [[ -n $key ]]; then
      $add_opt "${key}" false
    else
      key=$param
      if (( $# == 2 )); then
        $add_opt "${key}" "$2"
      else
        $add_opt "${key}" true
      fi
    fi
  fi
}

_l.0_6_0_124023316_30179_parse_params_add_none() {
  return 0
}

_l.0_6_0_124023316_30179_parse_params_add_opt() {
  # shellcheck disable=1087
  eval "$opts_name[\$1]=\"\$2\""
}

_l.0_6_0_124023316_30179_parse_params_add_arg() {
  eval "$args_name+=(\"\$1\")"
}

l.parse_params() {
  if (( $# < 2 )); then
    echo "parse_params: programming error. Parameters cannot less than 2." >&2
    return 3
  fi

  local add_opt add_arg
  if [[ $1 != _ ]]; then
    local opts_name=$1
    add_opt=_l.0_6_0_124023316_30179_parse_params_add_opt
  else
    add_opt=_l.0_6_0_124023316_30179_parse_params_add_none
  fi

  if [[ $2 != _ ]]; then
    local args_name=$2
    add_arg=_l.0_6_0_124023316_30179_parse_params_add_arg
  else
    add_arg=_l.0_6_0_124023316_30179_parse_params_add_none
  fi

  local param_size=$#
  local param i
  local rest_is_args=false

  for (( i = 3; i <= param_size; i++ )); do
    param=${!i}

    if l.start_with "$param" '-'; then
      local j=$(( i+1 ))
      local f

      if [[ $param == '--' ]]; then
        rest_is_args=true
        (( i+=1 ))
        break;
      fi

      if l.start_with "$param" '--'; then
        f=_l.0_6_0_124023316_30179_parse_double_hyphen_options
      else
        f=_l.0_6_0_124023316_30179_parse_single_hyphen_options
      fi

      if (( j > param_size )) ; then
        $f "$param"
      else
        local next=${!j}
        if l.start_with "$next" '-' ; then
          $f "$param"
        else
          $f "$param" "$next"
        fi
      fi
    else
      $add_arg "$param"
    fi
  done

  if [[ $rest_is_args == true ]]; then
    for (( ; i <= param_size; i++ )); do
      $add_arg "${!i}"
    done
  fi
}

l.pwd() {
  printf '%s\n' "$PWD"
}

l.random() {
  local length=${1:-10}
  local pattern=${2:-a-zA-Z0-9@#*=[]}
  local result=''

  # This line does not work in Github Action. See https://github.com/orgs/community/discussions/39644
  # printf '%s\n' "$(LC_ALL=C tr -dc "$pattern" < /dev/urandom | head -c "$length" || true)"

  while (( ${#result} < length )); do
    result="$result$(dd bs=512 if=/dev/urandom count=1 2>/dev/null | LC_ALL=C tr -dc "$pattern" | head -c "$length" || true)"
  done

  echo "${result:0:$length}"
}

if (( BASH_VERSINFO[0] == 4 )) && (( BASH_VERSINFO[1] < 4 )); then
  l.read_array() {
    IFS=$'\n' readarray -t "$1"
  }
else
  l.read_array() {
    readarray -d $'\n' -t "$1"
  }
fi

l.relative() {
  local from=${1:-.}
  local to=${2:-.}

  from=$(l.normalize "$from")
  to=$(l.normalize "$to")

  local result=''

  while [[ "${to#"$from"}" == "$to" ]]; do
    if [[ $from == '.' ]]; then
      break
    fi

    from=$(dirname "$from")
    if [[ -z $result ]]; then
      result="../"
    else
      result="../$result"
    fi
  done

  forward_part="${to#"$from"}"
  forward_part="${forward_part#/}" # remove head slash

  if [[ -n $result ]]; then
    result="$result$forward_part"
  else
    result="${forward_part}"
  fi

  echo "${result%/}" # remove tail slash
}

l.repeat() {
  local -i n=$1
  (( n == 0 )) && return
  (( n < 0 )) && return

  shift
  for n in $(seq "$n"); do
    "$@"
  done
}

l.rgb_to_hex() {
  if (( $# != 3 )); then
    echo 'The arguments size not equal 3' >&2
    return 3
  fi

  if ! l.is_number "$1"; then
    echo 'The first argument is not a number' >&2
    return 4
  fi

  if ! l.is_number "$2"; then
    echo 'The second argument is not a number' >&2
    return 5
  fi

  if ! l.is_number "$3"; then
    echo 'The third argument is not a number' >&2
    return 6
  fi

  printf '#%02x%02x%02x\n' "$1" "$2" "$3"
}

if _lobash.0_6_0_124023316_30179_is_gnu_sed; then
  l.sedi() { sed -i'' "$@"; }
else
  l.sedi() { sed -i '' "$@"; }
fi

l.seq() {
  local i
  for i in $(eval "echo {$2..$3..${4:-1}}"); do $1 "$i"; done
}


l.sleep() {
  # Reset IFS in case
  local IFS=''
  local _sleep_fd

  if [[ $OSTYPE =~ darwin ]]; then
    # MacOS will show shows "/dev/fd/62: Permission denied" on `exec {_sleep_fd}<> <(true)`. So we make a workaround.

    if [[ ! -p ${_L_0_6_0_124023316_30179_SLEEP_TEMP:-} ]]; then
      # Get available temp file path
      _L_0_6_0_124023316_30179_SLEEP_TEMP=$(mktemp -u)
      # Create a FIFO special file
      mkfifo -m 700 "$_L_0_6_0_124023316_30179_SLEEP_TEMP"
    fi

    exec {_sleep_fd}<>"$_L_0_6_0_124023316_30179_SLEEP_TEMP"
  else
    exec {_sleep_fd}<> <(true)
  fi

  # Wait for timeout
  read -rst "${1:-1}" -u "$_sleep_fd" || true
  # Close fd
  exec {_sleep_fd}<&-
}

l.sort() {
  local _array_name_=$1
  shift
  eval "printf '%s\\n' \"\${${_array_name_}[@]:-}\" | sort \"\$@\""
}

_l.0_6_0_124023316_30179_split() {
  local -i i

  local dLen=${#delimiter}
  local sLen=${#string}

  if [[ $delimiter == '' ]]; then
    for (( i=0; i < sLen; i++ )); do
      printf '%s\n' "${string:$i:1}"
    done
    return 0
  fi

  local -a indexes=()
  local -i a=0 b=0 d

  while (( a < "$sLen" )); do
    for (( b=a+1; b <= sLen; b++ )); do
      d=$(( b - a )) || true
      if (( d > dLen )); then
        break;
      fi

      if [[ "${string:$a:$d}" == "$delimiter" ]]; then
        indexes+=("$a")
      fi
    done
    (( a++ )) || true
  done

  a=0
  if (( ${#indexes[@]} > 0 )); then
    for i in "${indexes[@]}"; do
      printf '%s\n' "${string:$a:$(( i - a ))}"
      a=$((i + dLen));
    done
  fi

  if (( a < sLen )); then
    printf '%s\n' "${string:$a}"
  elif (( a == sLen )); then
    printf '\n'
  fi
}

l.split() {
  local string=$1
  local output=$2
  local delimiter

  if [[ $# == 2 ]]; then
    delimiter=' '
  else
    delimiter="${3}"
  fi

  if [[ $2 == '-' ]]; then
    _l.0_6_0_124023316_30179_split
  else
    IFS=$'\n' readarray -t "$output" < <(_l.0_6_0_124023316_30179_split)
  fi
}

l.start_with() {
  [[ $1 =~ ^"$2" ]]
}

l.start_with.s() {
  l.start_with "$@" && echo true || echo false
}


l.str_include() {
  [[ ${2:-} == '' ]] && return 0
  [[ "${1:-}" =~ "${2:-}" ]]
}


l.str_include.s() {
  l.str_include "$@" && echo true || echo false;
}

l.str_len() {
  [[ -z ${1:-} ]] && echo 0 && return

  local old_lang old_lc_all bytlen
  [[ -n ${LC_ALL:-} ]] && old_lc_all=$LC_ALL
  [[ -n ${LANG:-} ]] && old_lang=$LANG

  LANG=C LC_ALL=C
  bytlen=${#1}
  printf -- '%s\n' "$bytlen"

  [[ -n ${old_lang:-} ]] && LANG=$old_lang
  if [[ -n ${old_lc_all:-} ]]; then
    LC_ALL=$old_lc_all
  fi
}

l.str_replace() {
  local pattern=${2:-}
  if [[ $pattern =~ ^'#' ]]; then pattern="\\$pattern" ; fi
  if [[ $pattern =~ ^'%' ]]; then pattern="\\$pattern" ; fi
  echo "${1/$pattern/${3:-}}"
}

l.str_replace_all() {
  echo "${1//${2:-}/${3:-}}"
}

l.str_replace_last() {
  echo "${1/%${2:-}/${3:-}}"
}

l.str_size() {
  [[ -z ${1:-} ]] && echo 0 && return

  # It not work with double-width characters when environment LANG is not UTF-8.
  local OLD_LANG
  [[ -n ${LANG:-} ]] && OLD_LANG=$LANG

  LANG=C.UTF-8
  printf '%s\n' "${#1}"

  if [[ -n ${OLD_LANG:-} ]]; then
    LANG=$OLD_LANG
  fi
}

l.sub() {
  eval "((${1}-=${2:-1})) || true"
}

l.term_size() {
  local status
  status=$(shopt -p checkwinsize)
  # (:;:) is a micro sleep to ensure the variables are exported immediately.
  shopt -s checkwinsize; (:;:)
  printf '%s\n' "$LINES" "$COLUMNS"
  $status
}

l.trace_count() {
  local label=${1:-trace}
  local key=_LOBASH_0_6_0_124023316_30179_trace_count_$label

  if [[ -z ${!key:-} ]]; then
    read -r "$key" <<< 0
  fi

  read -r "$key" <<< $(( ${!key} + 1 ))

  printf '[%s] count: %s\n' "$label" "${!key}"
}

l.trace_end() {
  set +o xtrace
  PS4=${_L_0_6_0_124023316_30179_TRACE_OLD_PS4:-$PS4}
}

l.trace_stack() {
  printf '%s\n%s\n' \
    "Trace Function Stack:${1:+ $1}" \
    "  # Function (File:Line)"

  local i
  # _LOBASH_0_6_0_124023316_30179_PUBLIC_DEPTH=1 in built lobash.bash, and _LOBASH_0_6_0_124023316_30179_PUBLIC_DEPTH=2 in test.
  for i in $(seq "$_LOBASH_0_6_0_124023316_30179_PUBLIC_DEPTH" $(( ${#FUNCNAME[@]} -1 ))); do
    printf -- '  - %s (%s:%s)\n' "${FUNCNAME[$i]}" "${BASH_SOURCE[$i]:-(shell)}" "${BASH_LINENO[$i]}"
  done
}

l.trace_start() {
  read -r _L_0_6_0_124023316_30179_TRACE_OLD_PS4 <<< "$PS4"
  local label=${2:-}
  [[ -n "$label" ]] && label="[$label]"

  case ${1:-2} in
    1 )
      PS4='+'${label}'[${LINENO}|${FUNCNAME[0]:+${FUNCNAME[0]}}()|$?${XTRACE_PIPE:+|${PIPESTATUS[*]}}]: '
      ;;
    2 )
      PS4='+'${label}'[$(basename ${BASH_SOURCE[0]}):${LINENO}|${FUNCNAME[0]:+${FUNCNAME[0]}}()|$?${XTRACE_PIPE:+|${PIPESTATUS[*]}}]: '
      ;;
    3 )
      PS4='+'${label}'[${BASH_SOURCE[0]}:${LINENO}|${FUNCNAME[0]:+${FUNCNAME[0]}}()|$?${XTRACE_PIPE:+|${PIPESTATUS[*]}}]: '
      ;;
    * )
      echo "Invalid PS4_LEVEL: $1" >&2
      return 3
      ;;
  esac

  set -o xtrace
}

l.trace_time() {
  local label=${1:-debug}
  local key=_LOBASH_0_6_0_124023316_30179_TRACE_TIME_$label
  local last_time=${!key:-}
  local current
  current="$(l.now)"

  printf '[%s] Current Timestamp: %s\n' "$label" "$current"

  if [[ -n $last_time ]]; then
    printf '[%s] Last Timestamp: %s\n[%s] Elapsed: %s\n' "$label" "$last_time" "$label" $(( $(l.now) - last_time ))
    read -r "$key" <<< "$current"
  else
    read -r "$key" <<< "$current"
  fi
}

_l.0_6_0_124023316_30179_trap_error() {
  echo "Error occurred. Error Stacks:" >&2

  local frame=0 LINE FUNC FILE
  while read -r LINE FUNC FILE < <(caller "$frame"); do
    printf -- '  - %s (%s:%s)\n' "${FUNC}" "${FILE}" "${LINE}"
    frame=$(( frame + 1 ))
  done
}

l.trap_error() {
  local trap_func=${1:-_l.0_6_0_124023316_30179_trap_error}
  # shellcheck disable=SC2064
  trap "$trap_func" ERR
}

l.trim() {
  local str=${1:-}
  str=$(l.trim_start "$str")
  l.trim_end "$str"
}

l.trim.p() {
  local str
  read -r str
  l.trim "$str"
}

_L_0_6_0_124023316_30179_TRIM_COLOR_ECS=$'\e'
_L_0_6_0_124023316_30179_TRIM_COLOR_ECS2=$'\u001b'
if [[ "$_L_0_6_0_124023316_30179_TRIM_COLOR_ECS" == "$_L_0_6_0_124023316_30179_TRIM_COLOR_ECS2" ]]; then
  if [[ $_LOBASH_0_6_0_124023316_30179_OS == Linux ]]; then
    _L_0_6_0_124023316_30179_TRIM_COLOR_REGEX=$_L_0_6_0_124023316_30179_TRIM_COLOR_ECS
  elif [[ $_LOBASH_0_6_0_124023316_30179_OS == MacOS ]] || [[ $_LOBASH_0_6_0_124023316_30179_OS == BSD ]]; then
    _L_0_6_0_124023316_30179_TRIM_COLOR_REGEX="\\$_L_0_6_0_124023316_30179_TRIM_COLOR_ECS"
  fi
else
  if [[ $_LOBASH_0_6_0_124023316_30179_OS == Linux ]]; then
    _L_0_6_0_124023316_30179_TRIM_COLOR_REGEX="($_L_0_6_0_124023316_30179_TRIM_COLOR_ECS|\\$_L_0_6_0_124023316_30179_TRIM_COLOR_ECS2)"
  elif [[ $_LOBASH_0_6_0_124023316_30179_OS == MacOS ]] || [[ $_LOBASH_0_6_0_124023316_30179_OS == BSD ]]; then
    _L_0_6_0_124023316_30179_TRIM_COLOR_REGEX="(\\$_L_0_6_0_124023316_30179_TRIM_COLOR_ECS|\\$_L_0_6_0_124023316_30179_TRIM_COLOR_ECS2)"
  fi
fi

l.trim_color() {
  ( (( $# == 0 )) || [[ -z ${1:-} ]]) && echo '' && return
  sed -E "s,${_L_0_6_0_124023316_30179_TRIM_COLOR_REGEX}[[0-9]*(;[0-9]+)*m,,g" <<< "$1"
}

l.trim_color.p() {
  local str
  read -r str
  l.trim_color "$str"
}

l.trim_end() {
  local str=${1:-}
  if (( $# < 2 )); then
    # https://stackoverflow.com/a/3352015
    printf '%s\n' "${str%"${str##*[![:space:]]}"}"
  else
    printf '%s\n' "${str%%"$2"}"
  fi
}

l.trim_end.p() {
  local str
  IFS='' read -r str

  if (( $# == 0 )); then
    l.trim_end "$str"
  else
    l.trim_end "$str" "${@}"
  fi
}

l.trim_start() {
  local str=${1:-}
  if (( $# < 2 )); then
    # https://stackoverflow.com/a/3352015
    printf '%s\n' "${str#"${str%%[![:space:]]*}"}"
  else
    printf '%s\n' "${str##"$2"}"
  fi
}

l.trim_start.p() {
  local str
  IFS='' read -r str

  if (( $# == 0 )); then
    l.trim_start "$str"
  else
    l.trim_start "$str" "${@}"
  fi
}

_l.0_6_0_124023316_30179_union_array() {
  if [[ -z ${l_union_array_map[$l_union_array_item]:-} ]]; then
    l_union_array_arr+=("$l_union_array_item")
    l_union_array_map["$l_union_array_item"]=1
  fi
}

l.union_array() {
  local -A l_union_array_map
  local l_union_array_item
  local -a l_union_array_arr

  eval "for l_union_array_item in \"\${${1}[@]}\"; do _l.0_6_0_124023316_30179_union_array; done || true"

  if (( $# > 1 )); then
    eval "for l_union_array_item in \"\${${2}[@]}\"; do _l.0_6_0_124023316_30179_union_array; done || true"
  fi

  l.echo_array l_union_array_arr
}


l.upper_case() {
  local str=${1:-}
  printf '%s\n' "${str^^}"
}

l.upper_case.p() {
  local str
  IFS='' read -r str
  l.upper_case "$str"
}

l.upper_first() {
  local str=${1:-}
  printf '%s\n' "${str^}"
}

l.upper_first.p() {
  local str
  IFS='' read -r str
  l.upper_first "$str"
}

l.with_ifs() {
  _lobash.0_6_0_124023316_30179_with_IFS "$@"
}

l.xdg_config_home() {
  printf '%s\n' "${XDG_CONFIG_HOME:-${HOME}/.config}"
}

######################## Skipped Modules ########################
