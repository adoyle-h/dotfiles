#shellcheck disable=SC2155

export CLICOLOR=1
# Preview https://geoff.greer.fm/lscolors/
export LSCOLORS=exgxFxDxcxdgDEHbHDacad   # BSD LSCOLORS
export LS_COLORS='di=34:ln=36:so=1;35:pi=1;33:ex=32:bd=33;46:cd=1;33;1;44:su=1;37;41:sg=1;37;1;43:tw=30;42:ow=30;43'  # Linux LS_COLORS

# \[ \] are necessary. Refer to http://apple.stackexchange.com/a/258965
BLACK="\[\e[0;30m\]"
GREY="\[\e[0;90m\]"
RED="\[\e[0;31m\]"
GREEN="\[\e[0;32m\]"
YELLOW="\[\e[0;33m\]"
BLUE="\[\e[0;34m\]"
PURPLE="\[\e[0;35m\]"
CYAN="\[\e[0;36m\]"
WHITE="\[\e[0;37;1m\]"

BOLD_BLACK="\[\e[30;1m\]"
BOLD_RED="\[\e[31;1m\]"
BOLD_GREEN="\[\e[32;1m\]"
BOLD_YELLOW="\[\e[33;1m\]"
BOLD_BLUE="\[\e[34;1m\]"
BOLD_PURPLE="\[\e[35;1m\]"
BOLD_CYAN="\[\e[36;1m\]"
BOLD_WHITE="\[\e[37;1m\]"

NORMAL_STYLE="\[\e[0m\]"
RESET_COLOR="\[\e[39m\]"

E_BLACK="\[\033[0;30m\]"
E_GREY="\[\033[0;90m\]"
E_RED="\[\033[0;31m\]"
E_GREEN="\[\033[0;32m\]"
E_YELLOW="\[\033[0;33m\]"
E_BLUE="\[\033[0;34m\]"
E_PURPLE="\[\033[0;35m\]"
E_CYAN="\[\033[0;36m\]"
E_WHITE="\[\033[0;37;1m\]"

E_BOLD_BLACK="\[\033[30;1m\]"
E_BOLD_RED="\[\033[31;1m\]"
E_BOLD_GREEN="\[\033[32;1m\]"
E_BOLD_YELLOW="\[\033[33;1m\]"
E_BOLD_BLUE="\[\033[34;1m\]"
E_BOLD_PURPLE="\[\033[35;1m\]"
E_BOLD_CYAN="\[\033[36;1m\]"
E_BOLD_WHITE="\[\033[37;1m\]"

E_NORMAL_STYLE="\[\033[0m\]"
E_RESET_COLOR="\[\033[39m\]"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color | xterm-256color) color_prompt=yes;;
  xterm-color | screen-256color) color_prompt=yes;;
esac

# shellcheck disable=SC2154
if [[ -n "$FORCE_COLOR_PROMPT" ]]; then
  color_prompt=yes
fi

__last_process_exit_status_for_PS() {
  local exit_status=$1
  if [[ $exit_status != 0 ]]; then
    echo -n "${E_RED}[😱 $exit_status]"
  fi
}

# http://jafrog.com/2013/11/23/colors-in-terminal.html
__trim_str_color() {
  # \x1B does not work
  local ecs=$(echo -e '\033')
  local reg="s,\\\[${ecs}\[[0-9]*;?[0-9]*m\\\],,g"
  echo -en "$1" | sed -E "$reg"
}

__fill_ps1_spaces() {
  local LINE=''
  local CHAR='—'
  local PS1_left=$1
  local PS1_right=$2
  local PS1_left_plain=$(__trim_str_color "$PS1_left")
  local PS1_right_plain=$(__trim_str_color "$PS1_right")
  local COLS=$(( $(tput cols) - ${#PS1_left_plain} - ${#PS1_right_plain} ))

  # For debug
  # echo -e PS1_left=$PS1_left >> ~/debug
  # echo -e PS1_right=$PS1_right >> ~/debug
  # echo -e PS1_left_plain=$PS1_left_plain >> ~/debug
  # echo -e PS1_right_plain=$PS1_right_plain >> ~/debug

  if [[ -n "$TMUX" ]]; then
    COLS=$(( COLS - 1 ))
  fi

  if [[ $COLS -lt 1 ]]; then
    #shellcheck disable=SC2028
    echo -n "\\n${E_GREEN} ➥"
    return 0
  fi

  while [[ ${#LINE} -lt COLS ]]
  do
    LINE="$LINE$CHAR"
  done

  echo -n "${E_GREY}${LINE:0:$COLS}"
}

__right_ps1() {
  local exit_status=$(__last_process_exit_status_for_PS $?)

  local stopped=$(jobs -sp | wc -l | tr -d '[:space:]')
  local running=$(jobs -rp | wc -l | tr -d '[:space:]')
  local sC rC job
  [[ $stopped -gt 0 ]] && sC="$E_YELLOW"
  [[ $running -gt 0 ]] && rC="$E_GREEN"
  local job="${E_GREY}[${rC}${running}r${E_GREY}/${sC}${stopped}s${E_GREY}]"

  local TIME=$(date +'%H:%M:%S')
  local PS1_prefix0="${exit_status}${job}${E_YELLOW}[T${TIME}]"
  echo -n "$PS1_prefix0"
}

__PS1_theme_adoyle() {
  local PS1_right="$(__right_ps1)"  # Because __right_ps1 use $?, it should be first
  local PS1_left="${E_GREEN}⧉ ${E_GREY}[ ${E_GREEN}$(pwd) ${E_GREY}]"
  local PS1_middle="$(__fill_ps1_spaces "${PS1_left}" "${PS1_right}")"
  local PS1_SIGNATURE="${PS1_SIGNATURE:-𝕬}"

  if command -v __git_ps1 &>/dev/null ; then
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWSTASHSTATE=1
    export GIT_PS1_SHOWUNTRACKEDFILES=1
    export GIT_PS1_SHOWCOLORHINTS=true
    export GIT_PS1_SHOWUPSTREAM="git"
    export GIT_PS1_DESCRIBE_STYLE="branch"
    export GIT_PS1_STATESEPARATOR=" "
    # shellcheck disable=SC2016
    local PS1_git="${E_BLUE}$(__git_ps1 " (%s)")"
  fi

  # shellcheck disable=SC2016
  local PS1_main="${E_GREEN}${PS1_SIGNATURE}${PS1_git}${E_NORMAL_STYLE} "
  local _PS1="$PS1_left$PS1_middle$PS1_right\\n${PS1_main}"

  if [[ $color_prompt != yes ]]; then
    _PS1=$(__trim_str_color "$_PS1")
  fi

  echo -en "$_PS1"
}

__prompt_command() {
  PS1=$(__PS1_theme_adoyle)
}

__prompt_HIST() {
  history -a
}

if [[ -n "$PROMPT_COMMAND" ]]; then
  if __no_matched_path "__prompt_command" "$PROMPT_COMMAND" ';'; then
    PROMPT_COMMAND="__prompt_command;$PROMPT_COMMAND;__prompt_HIST"
  fi
else
  PROMPT_COMMAND="__prompt_command;__prompt_HIST"
fi
