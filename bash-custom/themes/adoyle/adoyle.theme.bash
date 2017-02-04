#shellcheck disable=SC2155

export CLICOLOR=1
# Preview https://geoff.greer.fm/lscolors/
export LSCOLORS=exgxFxDxcxdhDhHbHDeced   # BSD LSCOLORS
export LS_COLORS='di=34:ln=36:so=1;35:pi=1;33:ex=32:bd=33;47:cd=1;33;47:su=1;37;41:sg=1;37;1;43:tw=34;42:ow=34;43'  # Linux LS_COLORS

BLACK="\[\e[0;30m\]"
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
    echo -n "${RED}[😱 $exit_status]"
  fi
}

__trim_str_color() {
  local reg='s,\\\[\x1B\[[0-9;]*[a-zA-Z]\\\],,g'
  echo -en "$1" | sed -r "$reg"
}

__fill_ps1_spaces() {
  local LINE=''
  local CHAR='—'
  local PS1_left=$1
  local PS1_right=$2
  local PS1_left_plant=$(__trim_str_color "$PS1_left")
  local PS1_right_plant=$(__trim_str_color "$PS1_right")
  echo -e PS1_left=$PS1_left >> ~/debug
  echo -e PS1_right=$PS1_right >> ~/debug
  echo -e PS1_left_plant=$PS1_left_plant >> ~/debug
  echo -e PS1_right_plant=$PS1_right_plant >> ~/debug
  local COLS=$(( $(tput cols) - ${#PS1_left_plant} - ${#PS1_right_plant} ))

  if [[ $COLS -lt 1 ]]; then
    #shellcheck disable=SC2028
    echo -n '\n'
    return 0
  fi

  while [[ ${#LINE} -lt COLS ]]
  do
    LINE="$LINE$CHAR"
  done

  echo -n "${BOLD_BLACK}${LINE:0:$COLS}"
}

__right_ps1() {
  local exit_status=$(__last_process_exit_status_for_PS $?)

  local stopped=$(jobs -sp | wc -l | tr -d '[:space:]')
  local running=$(jobs -rp | wc -l | tr -d '[:space:]')
  local sC rC job
  [[ $stopped -gt 0 ]] && sC="$YELLOW"
  [[ $running -gt 0 ]] && rC="$GREEN"
  local job="${BOLD_BLACK}[${rC}${running}r${BOLD_BLACK}/${sC}${stopped}s${BOLD_BLACK}]"

  local last_command=($(history 1))
  local history_num=$(( last_command[0] + 1 ))
  local TIME=$(date +'%H:%M:%S')
  local PS1_prefix0="${exit_status}${job}${CYAN}[H${history_num}]${YELLOW}[T${TIME}]"
  echo -n "$PS1_prefix0"
}

__PS1_theme_adoyle() {
  local PS1_right="$(__right_ps1)"  # Because __right_ps1 use $?, it should be first
  local PS1_left="${GREEN}⧉ ${BOLD_BLACK}[ ${GREEN}$(pwd) ${BOLD_BLACK}]"
  local PS1_middle="$(__fill_ps1_spaces "${PS1_left}" "${PS1_right}")"

  if command -v __git_ps1 &>/dev/null ; then
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWSTASHSTATE=1
    export GIT_PS1_SHOWUNTRACKEDFILES=1
    export GIT_PS1_SHOWCOLORHINTS=true
    export GIT_PS1_SHOWUPSTREAM="git"
    export GIT_PS1_DESCRIBE_STYLE="branch"
    export GIT_PS1_STATESEPARATOR=" "
    # shellcheck disable=SC2016
    local PS1_git="${BLUE}$(__git_ps1 " (%s)")"
  fi

  # shellcheck disable=SC2016
  local PS1_main="${GREEN}𝕬${PS1_git}${NORMAL_STYLE} "
  local _PS1="$PS1_left${BOLD_BLACK}$PS1_middle$PS1_right\n${PS1_main}"

  if [[ $color_prompt != yes ]]; then
    _PS1=$(__trim_str_color "$PS1")
  fi

  echo -en "$_PS1"
}

__prompt_command() {
  PS1=$(__PS1_theme_adoyle)
}

if [[ -n "$PROMPT_COMMAND" ]]; then
  PROMPT_COMMAND="__prompt_command; $PROMPT_COMMAND"
else
  PROMPT_COMMAND=__prompt_command
fi
