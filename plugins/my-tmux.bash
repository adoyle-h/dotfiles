about-plugin 'Personal settings for tmux'

alias tmux-pane-title='tmux select-pane -T'
alias tmux-pane-title-bottom='tmux set pane-border-status bottom'
alias tmux-pane-title-top='tmux set pane-border-status top'
alias tmux-pane-title-off='tmux set pane-border-status off'

tm() {
  if [[ -n $TMUX ]]; then
    echo "You are already in tmux" >&2
    return 2
  fi

  if tmux has; then
    tmux a
  else
    tmux new -A -s "work" -n "main"
  fi
}

function tmux-mouse-on() {
  tmux set -g mouse on
  tmux display-message 'Mouse: ON'
}

function tmux-mouse-off() {
  tmux set -g mouse off
  tmux display-message 'Mouse: Off'
}

function tmux-toggle-mouse() {
  local old
  old=$(tmux show -gv mouse)

  if [ "$old" = "on" ]; then
    tmux-mouse-off
  else
    tmux-mouse-on
  fi
}

function tmux-list-panes() {
  tmux lsp -F '#{pane_index}: [#{pane_width}x#{pane_height}] paneId=#{pane_id} #{pane_tty} #{?pane_active,(active),} #{?pane_dead,(dead),}'
}

# https://gist.github.com/thugcee/41d1ba786fa5e66167ed6ee45e4f6346
tmux-windows() {
  local display="#{session_id}|#{window_id}|	#{session_name}: #{window_name}"
  local line
  # shellcheck disable=2091
  line=$(tmux list-windows -a -F "$display" | $(__fzfcmd 2>/dev/null || echo fzf)) || return 0
  # shellcheck disable=2206
  local args=( ${line//|/ } )

  tmux switch-client -t "${args[0]}"
  tmux select-window -t "${args[1]}"
}
