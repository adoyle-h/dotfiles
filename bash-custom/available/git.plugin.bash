cite about-plugin
about-plugin 'Add alias "g" and "gti" for git'

alias g='git'
alias gti='git'

if [[ "$(type -t __git_complete)" == 'function' ]] && [[ "$(type -t __git_main)" == 'function' ]] ; then
  __git_complete g __git_main
  __git_complete gti __git_main
fi
