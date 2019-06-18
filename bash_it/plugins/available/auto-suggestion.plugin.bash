cite about-plugin
about-plugin 'auto-suggestion like zsh'


__A_KEYMAP_SEARCH_HISTORY_MAX=100
__A_KEYMAP_SHOW_HISTORY_MAX=10

__a_keymap_search_history() {
  local _HISTTIMEFORMAT=$HISTTIMEFORMAT
  HISTTIMEFORMAT=''
  history $__A_KEYMAP_SEARCH_HISTORY_MAX | awk '{print $2}' | grep -i ^"$1" | uniq | head -n $__A_KEYMAP_SHOW_HISTORY_MAX || true
  HISTTIMEFORMAT=$_HISTTIMEFORMAT
}

__a_keymap_self_key() {
  local t=$1
  local cmd="$READLINE_LINE$t"
  local results
  results=$(__a_keymap_search_history "$cmd")

  if [[ -n $results ]]; then
    # save current cursor position
    tput sc
    # clear to end of screen (clr_eos)
    tput cd
    printf '\n%b%s' "${CYAN}" "${results[@]}"
    # printf '\n%b%s' "${GREY}" "$(__a_keymap_search_history "$cmd")"
    # reset cursor position
    tput rc
  else
    # clear to end of screen (clr_eos)
    tput cd
  fi

  READLINE_LINE="$cmd"
  READLINE_POINT=$(( READLINE_POINT + ${#t} ))
}

wrap_key() {
  local key=$1
  eval "
    __a_keymap_${key}() {
      __a_keymap_self_key ${key}
    }
    bind -x '\"${key}\": \"__a_keymap_${key}\"'
  "
}

for key in {a..z}; do
  wrap_key $key
done

for key in {A..Z}; do
  wrap_key $key
done

for key in {0..9}; do
  wrap_key $key
done

wrap_key _
wrap_key -
wrap_key #
