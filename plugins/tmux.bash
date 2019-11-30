cite about-plugin
about-plugin 'Tmux settings'

function tmux_mouse_turn_on() {
  tmux set -g mouse on
  tmux display-message 'Mouse: ON'
}

function tmux_mouse_turn_off() {
  tmux set -g mouse off
  tmux display-message 'Mouse: Off'
}

function tmux_toggle_mouse() {
  local old
  old=$(tmux show -gv mouse)

  if [ "$old" = "on" ]; then
    tmux_mouse_turn_off
  else
    tmux_mouse_turn_on
  fi
}

function tmux_list_panes() {
  tmux lsp -F '#{pane_index}: [#{pane_width}x#{pane_height}] paneId=#{pane_id} #{pane_tty} #{?pane_active,(active),} #{?pane_dead,(dead),}'
}

[[ -z "$TMUX" ]] && export TMUX

true
