cite about-plugin
about-plugin 'Better bash history behaviors'

## shell history
# Don't record some commands in history
HISTIGNORE='exit:fg:bg:ls:sl:pwd:history:clear'
# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoredups
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=1000
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '

## Refer to https://sanctum.geek.nz/arabesque/bash-history-expansion/
# disable ! style history substitution
set +o histexpand

# Not allow re-edit history substitution.
shopt -u histreedit

# the history list is appended to the file named by the value of the HISTFILE
# variable when the shell exits, rather than overwriting the file.
# shopt -s histappend
# We have used `history -a` in PROMPT_COMMAND. So close histappend.
shopt -u histappend

# shopt -s histappend

# If set, and readline is being used, the results of history substitution are
# not immediately passed to the shell parser. Instead, the resulting line is
# loaded into the readline editing buffer, allowing further modification.
shopt -s histverify

# bash attempts to save all lines of a multiple-line command in the same
# history entry. This  allows easy re-editing of multi-line commands.
shopt -s cmdhist
