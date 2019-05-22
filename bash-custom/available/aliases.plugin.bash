cite about-plugin
about-plugin 'A sets of normal aliases'

# colored grep
# Need to check an existing file for a pattern that will be found to ensure
# that the check works when on an OS that supports the color option
if echo 'a' | grep --color=auto 'a' &> /dev/null
then
  alias grep='grep --color=auto'
fi

alias df='df -h'
alias du='du -h'
alias suho='sudo -HE'
alias cp='cp -i'
alias tree='tree -CFN'

alias irc='irssi'
alias nginx='/etc/init.d/nginx'
alias edit='nvim'
alias pager='nvim'
alias dm='docker-machine'
# fpp is https://github.com/facebook/PathPicker
alias fpp='fpp -ni'

# GNU File, Shell, and Text utilities for mac
# depend on: brew install coreutils
alias date='gdate'
alias timeout='gtimeout'
alias truncate='gtruncate'
