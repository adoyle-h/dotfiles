# shellcheck disable=2034
# ONE_LOAD_PRIORITY: 190
about-plugin 'A personal settings for myself'

if one_l.has command adoyle; then
  source <(adoyle completion bash)
fi

if one_l.has command massren; then
  alias rename-files='massren'
fi

alias c='bat'
alias usrctl='systemctl --user'
alias neo="nvim"

alias g='git'
alias gti='git' # for typo

if [[ "$(type -t __git_complete)" == 'function' ]] && [[ "$(type -t __git_main)" == 'function' ]] ; then
  __git_complete gti __git_main
  __git_complete g __git_main
fi

# alias tm='if [ -z $TMUX ]; then tmux -CC new-session -A -s "work" -n "main"; fi'

diff-fancy() {
  diff -u "$1" "$2" | diff-so-fancy
}

# export HOMEBREW_AUTO_UPDATE_SECS=86400 # 1 day
export HOMEBREW_NO_AUTO_UPDATE=1

export KNOWLEDGE_HOME=/Users/adoyle/Doc/Today-I-Learned,/Users/adoyle/Doc/What-I-Read

# https://github.com/adoyle-h/iThoughts-Search
export ITMZ_DIR=~/Dropbox/My/knowledge-library
export ITMZ_HOME=~/.itmz

export KUBECONFIG=~/.kube/config:~/.kube/work-dev.config:~/.kube/work-test.config

show_color() {
  perl -e 'foreach $a(@ARGV){print "\e[48:2::".join(":",unpack("C*",pack("H*",$a)))."m \e[49m "};print "\n"' "$@"
}

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

export ZK_NOTEBOOK_DIR="$XDG_DATA_HOME/zk/notebooks"
GOPATH="$HOME/Workspace/go"
