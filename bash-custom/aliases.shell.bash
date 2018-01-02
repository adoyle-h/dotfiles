# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable color support of ls and also add handy aliases
if [[ -x /usr/bin/dircolors ]]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias dir='dir --color=auto'
fi

if ls --color -d . &> /dev/null ; then
  alias ls="ls --color=auto"
elif ls -G -d . &> /dev/null ; then
  alias ls='ls -G'        # Compact view, show colors
else
  alias ls='ls -F'
fi

# colored grep
# Need to check an existing file for a pattern that will be found to ensure
# that the check works when on an OS that supports the color option
if echo 'a' | grep --color=auto 'a' &> /dev/null
then
  alias grep='grep --color=auto'
fi

alias ll='ls -ahlF'
alias la='ls -A'
alias l='la'
alias rm='rm -i'
alias df='df -h'
alias du='du -h'
alias suho='sudo -HE'
alias cp='cp -i'
alias tree='tree -CFN'

alias t='todo.sh'
alias bit='bash-it'
alias irc="irssi"
alias nginx='/etc/init.d/nginx'
alias edit="nvim"
alias pager="nvim"
alias dm='docker-machine'
alias fpp='fpp -ni'

# GNU File, Shell, and Text utilities for mac
# depend on: brew install coreutils
alias date='gdate'
alias timeout='gtimeout'
alias truncate='gtruncate'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
