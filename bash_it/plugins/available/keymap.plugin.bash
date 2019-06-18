cite about-plugin
about-plugin 'bind some keymaps for terminal'

__a_keymap_trigger_sudo() {
  local r

  r=$(l.start_with "$READLINE_LINE" "sudo ")

  local t
  if [[ $r == true ]]; then
    t="$(l.trim_start "$READLINE_LINE" 'sudo ')"
  else
    t="sudo ${READLINE_LINE}"
  fi

  READLINE_LINE="$t"
  READLINE_POINT=$(( READLINE_POINT + ${#t} ))
}

bind -x '"\es": "__a_keymap_trigger_sudo"'
# bind -x '"\es": " \C-u \C-a\C-k`__a_keymap_trigger_sudo`\e\C-e"'
# bind '"\es": "\C-asudo \C-e"'

# Press tab to completion in circle
bind "TAB:menu-complete"

# Shift+Tab move backward
bind '"\e[Z":menu-complete-backward'

# Use the text that has already been typed as the prefix for searching through
# commands (i.e. more intelligent Up/Down behavior)
bind '"\e[B": history-search-forward'
bind '"\e[A": history-search-backward'

# Use Alt/Meta + Delete to delete the preceding word
bind '"\e[3;3~": kill-word'

bind '"\e[5C": forward-word'
bind '"\e[5D": backward-word'
