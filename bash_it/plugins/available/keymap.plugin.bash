cite about-plugin
about-plugin 'bind some keymaps for terminal'

_a_keymap_ctrl=$'\c'
ESC='\e'
CTRL="$ESC["
CTRL_A="$ESC[1p"
CTRL_E="$ESC[5p"

__a_keymap_trigger_sudo() {
  # printf '%s' "sudo ${READLINE_LINE}"
  # printf '%b%s%b' "" "sudo ${READLINE_LINE}" ""
  printf '%s%s%b' '\C-a' "sudo ${READLINE_LINE}" '\C-e'
}

# bind -x '"\es": __a_keymap_trigger_sudo'
bind '"\es": "\C-asudo \C-e"'
