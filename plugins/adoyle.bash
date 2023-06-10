# shellcheck disable=2034
# ONE_LOAD_PRIORITY: 190
about-plugin 'Personal settings for myself'

if one_l.has command massren; then
  alias rename-files='massren'
fi

# Make a steady cursor
# https://invisible-island.net/xterm/ctlseqs/ctlseqs.html#h4-Functions-using-CSI-_-ordered-by-the-final-character-lparen-s-rparen:CSI-Ps-SP-q.1D81
# printf -- '\x1b[6 q' >/dev/tty

# PROMPT_FORMAT_EXIT_STATUS='✖%s'

alias neo="nvim"
alias irc='irssi'

alias g='git'
alias gti='git' # for typo

if [[ "$(type -t __git_complete)" == 'function' ]] && [[ "$(type -t __git_main)" == 'function' ]] ; then
  __git_complete gti __git_main
  __git_complete g __git_main
fi

diff-fancy() {
  diff -u "$1" "$2" | diff-so-fancy
}

export KNOWLEDGE_HOME=/Users/adoyle/Doc/Today-I-Learned,/Users/adoyle/Doc/What-I-Read

# https://github.com/adoyle-h/iThoughts-Search
export ITMZ_DIR=~/Dropbox/My/knowledge-library
export ITMZ_HOME=~/.itmz

export KUBECONFIG=~/.kube/config:~/.kube/work-dev.config:~/.kube/work-test.config

show_color() {
  perl -e 'foreach $a(@ARGV){print "\e[48:2::".join(":",unpack("C*",pack("H*",$a)))."m \e[49m "};print "\n"' "$@"
}

export ZK_NOTEBOOK_DIR="$XDG_DATA_HOME/zk/notebooks"
GOPATH="$HOME/Workspace/go"


# bind __fzf_cd__ from ALT-C to ALT-T
bind -m emacs-standard '"\et": " \C-e\C-u`__fzf_cd__`\e\C-e\er\C-m"'
# bind ALT-C to capitalize-word (follow emacs bindings style)
bind -m emacs-standard '"\ec": capitalize-word'


#### binding functions ####

__a_keymap_trigger_sudo() {
  local r

  r=$(one_l.start_with "$READLINE_LINE" "sudo ")

  local t
  if [[ $r == true ]]; then
    t="$(one_l.trim_start "$READLINE_LINE" 'sudo ')"
  else
    t="sudo ${READLINE_LINE}"
  fi

  READLINE_LINE="$t"
  READLINE_POINT=$(( READLINE_POINT + ${#t} ))
}

# Alt+S
# bind -x '"\es": "__a_keymap_trigger_sudo"'
# bind -x '"\es": " \C-u \C-a\C-k`__a_keymap_trigger_sudo`\e\C-e"'
# bind '"\es": "\C-asudo \C-e"'


with-proxy() {
  local MY_PROXY=${MY_PROXY:-127.0.0.1:7890}
  local http_proxy="http://$MY_PROXY"
  local https_proxy="http://$MY_PROXY"
  local socket_proxy="socks5://$MY_PROXY"

  shopt -s expand_aliases

  # shellcheck disable=2097
  http_proxy="$http_proxy" \
  HTTP_PROXY="$http_proxy" \
  https_proxy="$https_proxy" \
  HTTPS_PROXY="$https_proxy" \
  ALL_PROXY="$socket_proxy" \
    "$@"
}
