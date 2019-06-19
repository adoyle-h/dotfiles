_P_KEYMAP_ENABLED=${_P_KEYMAP_ENABLED:-false}
_P_KEYMAP_LOG=${_P_KEYMAP_LOG:-$HOME/.keymap/common.log}
_P_KEYMAP_JOB_LOG=${_P_KEYMAP_JOB_LOG:-$HOME/.keymap/job.log}
_P_KEYMAP_SEARCH_HISTORY_MAX=${_P_KEYMAP_SEARCH_HISTORY_MAX:-100}

_P_KEYMAP_SHOW_HISTORY_MAX=9
_P_KEYMAP_SEARCH_RESULTS=''
_P_KEYMAP_SUGGESTIONS=''
_P_KEYMAP_LAST_TIMESTAMP=0

mkdir -p "$(dirname "$_P_KEYMAP_LOG")"

_p_keymap_clear_rest_screen_preexec() {
  # if [[ -z ${_P_KEYMAP_SEARCH_RESULTS} ]]; then
  #   return
  # fi

  # 1. save current cursor position
  # 2. move cursor to next line
  # 3. clear to end of screen (clr_eos)
  # 4. reset cursor position
  tput -S <<EOF
sc
up
cd
rc
EOF
}

_p_keymap_clear_rest_screen() {
  # 1. save current cursor position
  # 2. move cursor to next line
  # 3. clear to end of screen (clr_eos)
  # 4. reset cursor position
  tput -S <<EOF
sc
do
cd
rc
EOF
}

_p_keymap_search_result_filter() {
  local -i count=0
  while read -r -d $'\n' line; do
    (( count++ ))
    printf -- '%-4s%s\n' "${count}. " "$line"
  done
}

_p_keymap_search_history() {
  HISTTIMEFORMAT='' history $_P_KEYMAP_SEARCH_HISTORY_MAX | cut -c8- | grep -i "^$1" | uniq | head -n $_P_KEYMAP_SHOW_HISTORY_MAX | _p_keymap_search_result_filter || true
}

_p_keymap_suggest_history() {
  local cmd="$1"
  local escaped_cmd="${cmd//[/\\[}"
  escaped_cmd="${escaped_cmd//]/\\]}"

  _P_KEYMAP_SEARCH_RESULTS=$(_p_keymap_search_history "$escaped_cmd")

  if [[ -n $_P_KEYMAP_SEARCH_RESULTS ]]; then
    _P_KEYMAP_SUGGESTIONS=$(
      printf '%b\n' "${GREY}Recent $_P_KEYMAP_SHOW_HISTORY_MAX History Commands:";
      printf '%b%s%b\n' "${CYAN}" "${_P_KEYMAP_SEARCH_RESULTS}" "${RESET_ALL}"
    )
  fi
}

_p_keymap_print_window() {
  local -i rows row suggestion_line_count
  rows=$(tput lines)
  row=$(l.cursor_row)

  suggestion_line_count=$(grep -c $'\n' _P_KEYMAP_SUGGESTIONS)
  local free_line_count=$(( rows - row ))
  # if (( free_line_count < 1 )) || (( free_line_count < 1 )); then
  #   return
  # fi

  printf '%s\n' "$_P_KEYMAP_SUGGESTIONS"
}

_p_keymap_async_job() {
  local cmd="$1"

  _p_keymap_suggest_history "$cmd"

  if [[ -n $_P_KEYMAP_SEARCH_RESULTS ]]; then
    # 1. save current cursor position
    # 2. move cursor to next line
    # 3. clear to end of screen (clr_eos)
    tput -S <<EOF
sc
do
cd
EOF

    _p_keymap_print_window

    # 4. reset cursor position
    tput rc

    l.repeat $free_line_count tput rc
  else
    _p_keymap_clear_rest_screen
  fi
}

_p_keymap_submit_a_job() {
  local P_KEYMAP_LAST_TIMESTAMP_OLD=$_P_KEYMAP_LAST_TIMESTAMP
  _P_KEYMAP_LAST_TIMESTAMP=$(l.now)

  if (( _P_KEYMAP_LAST_TIMESTAMP - P_KEYMAP_LAST_TIMESTAMP_OLD < 500 )); then
    return
  fi

  (_p_keymap_async_job "$1" 1>/dev/tty 2>> "$_P_KEYMAP_JOB_LOG" &) &>/dev/null
}

_p_keymap_self_key() {
  local c=$1

  READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}$c${READLINE_LINE:$READLINE_POINT}"
  (( READLINE_POINT++ ))

  _p_keymap_submit_a_job "$READLINE_LINE"
}

_p_keymap_wrap_key() {
  local key=$1
  eval "
    _p_keymap_${key}() {
      _p_keymap_self_key ${key}
    }
    bind -x '\"${key}\": \"_p_keymap_${key}\"'
  "
}

_p_keymap_cancel_wrap() {
  local key=$1
  bind "\"${key}\": self-insert"
}

_p_keymap_cancel_wrapped_keys() {
  for key in {a..z}; do
    _p_keymap_cancel_wrap $key
  done

  for key in {A..Z}; do
    _p_keymap_cancel_wrap $key
  done

  for key in {0..9}; do
    _p_keymap_cancel_wrap $key
  done

  _p_keymap_cancel_wrap _
  _p_keymap_cancel_wrap -
  _p_keymap_cancel_wrap #

  stty kill '\C-u'
  bind -r '"\C-u"'

  stty werase '\C-w'
  bind -r '"\C-w"'
}

_p_keymap_wrap_keys() {
  for key in {a..z}; do
    _p_keymap_wrap_key $key
  done

  for key in {A..Z}; do
    _p_keymap_wrap_key $key
  done

  for key in {0..9}; do
    _p_keymap_wrap_key $key
  done

  _p_keymap_wrap_key _
  _p_keymap_wrap_key -
  _p_keymap_wrap_key #

  # remove \C-u key binding by stty
  stty kill ''
  bind -x '"\C-u": "_p_keymap_wrap_ctrl_u"'

  # remove \C-u key binding by stty
  # stty werase ''
  # bind -x '"\C-w": "_p_keymap_wrap_ctrl_w"'
}

_p_keymap_wrap_ctrl_u() {
  READLINE_LINE="${READLINE_LINE:READLINE_POINT}"
  READLINE_POINT=${#READLINE_LINE}

  if [[ -z "$READLINE_LINE" ]]; then
    _p_keymap_clear_rest_screen
  fi
}

_p_keymap_wrap_ctrl_w() {
  return
  # TODO: it is hard to implement werase function

  # if input is empty ; then
  #   _p_keymap_clear_rest_screen
  # fi
}

_p_keymap_toggle_wrapped_keys() {
  if [[ $_P_KEYMAP_ENABLED == true ]]; then
    _p_keymap_cancel_wrapped_keys
    echo "Auto Suggestion Disabled"
    _P_KEYMAP_ENABLED=false
  else
    _p_keymap_wrap_keys
    echo "Auto Suggestion Enabled"
    _P_KEYMAP_ENABLED=true
  fi
}

_p_keymap_completion() {
  echo =====
}

_p_keymap_alt_1() {
  echo 1
}

_p_keymap_alt_2() {
  echo 2
}

_p_keymap_alt_3() {
  echo 3
}

_p_keymap_alt_4() {
  echo 4
}

_p_keymap_alt_5() {
  echo 5
}

_p_keymap_alt_6() {
  echo 6
}

_p_keymap_alt_7() {
  echo 7
}

_p_keymap_alt_8() {
  echo 8
}

_p_keymap_alt_9() {
  echo 9
}

###################

if [[ $_P_KEYMAP_ENABLED == true ]]; then
  _p_keymap_wrap_keys
fi

# if [[ ! -v preexec_functions ]]; then
#   preexec_functions=()
# fi

# clear rest screen before execute command
# preexec_functions+=(_p_keymap_clear_rest_screen_preexec)

# precmd_functions=()
# precmd_functions+=(_p_keymap_clear_rest_screen_preexec)

##### keymaps #####

# Ctrl+E Ctrl+E to toggle key wrap
bind -x '"\C-e\C-e": "_p_keymap_toggle_wrapped_keys"'
# bind -x '"\e0": "_p_keymap_toggle_wrapped_keys"'

# Alt+Tab to complete
# bind -x '"\C-i": "_p_keymap_completion"'

# Alt+1 to Alt+9
for i in {1..9}; do
  bind -x "\"\\e$i\": \"_p_keymap_alt_$i\""
done
