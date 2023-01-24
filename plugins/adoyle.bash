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

export ZK_NOTEBOOK_DIR="$XDG_DATA_HOME/zk/notebooks"
GOPATH="$HOME/Workspace/go"

_comp_with_proxy() {
  if (( COMP_CWORD < 2 )); then
    compgen -acA -- "$1"

    result=$(compgen -f -- "$1")
    if [[ -d $result ]]; then
      compgen -f -- "$result/"
    else
      echo "${result[@]}"
    fi
  else
    echo "${COMP_WORDS[COMP_CWORD]}" >/dev/tty
    compgen -- "${COMP_WORDS[COMP_CWORD]}"
  fi
}
complete -F _comp_with_proxy with-proxy
