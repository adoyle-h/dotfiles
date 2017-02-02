export CLICOLOR=1
export LSCOLORS=exgxFxDxcxdhDhHbHDeced

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
  screen-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
  color_prompt=yes
fi

__last_process_exit_status_for_PS() {
  local exit_status=$1
  if [[ $exit_status != 0 ]]; then
    echo '[😱 '"$exit_status]"
  fi
}

__main_theme() {
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWSTASHSTATE=1
  export GIT_PS1_SHOWUNTRACKEDFILES=1
  export GIT_PS1_SHOWCOLORHINTS=true
  export GIT_PS1_SHOWUPSTREAM="git"
  export GIT_PS1_DESCRIBE_STYLE="branch"
  export GIT_PS1_STATESEPARATOR=" "

  local PS1_prefix0='\[\e[1m\]> \[\e[0;33m\][History \!|\#] [Time \A] [Jobs \j] '"$(__last_process_exit_status_for_PS $?)"' \[\e[m\]\n'
  local PS1_prefix1='\[\e[1m\]> \[\e[0;32m\]\w\[\e[m\]\n'
  local PS1_prefix=$PS1_prefix0$PS1_prefix1

  # shellcheck disable=SC2155,SC2016
  local PS1_main='\[\e[1;32m\]𝕬\[\e[1;34m\]$(__git_ps1 " (%s)")\[\e[m\] '
  PS1=$PS1_prefix$PS1_main

  if [[ $color_prompt != yes ]]; then
    PS1=$(echo "$PS1" || sed "s,\x1B\[[0-9;]*[a-zA-Z],,g")
  fi
}

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    __main_theme
    ;;
esac

unset -f _main_theme
unset force_color_prompt
