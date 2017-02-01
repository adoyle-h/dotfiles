#---------------------------- Shell Variables --------------------------------#

## shell history
HISTIGNORE='ls:sl:bg:fg:history'
# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoredups
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000
HISTTIMEFORMAT='%F %T '

# Specifies how often (in seconds)  bash  checks  for  mail.   The
# default  is  60 seconds.  When it is time to check for mail, the
# shell does so before displaying the  primary  prompt.   If  this
# variable  is  unset,  or  set  to  a  value that is not a number
# greater than or equal to zero, the shell disables mail checking.
unset -v MAILCHECK
