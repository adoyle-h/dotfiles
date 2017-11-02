#!/usr/bin/env bash
# shellcheck disable=SC1090

[[ -z "$PS1" ]] && return 0


if [[ -d $HOME/.bash_completions ]]; then
  completion_files="$HOME/.bash_completions/*.sh $HOME/.bash_completions/*.bash"
  for file in $completion_files; do
    source "$file"
  done
fi


# System completion should be first

GET_BASH_MAJOR_VERSION() {
  if [[ -n "$TMUX" ]]; then
    local bsh="$SHELL"
  else
    local bsh="$BASH"
  fi
  "$bsh" --version | sed -E -n 's@.*[(version)|(版本)] ([0-9]{1,})\.[0-9]{1,}\.[0-9]{1,}\(1\)-release.*@\1@p'
}
# echo GET_BASH_MAJOR_VERSION-----$GET_BASH_MAJOR_VERSION

if [[ -x "$(command -v brew)" ]] ; then
  # If Homebrew is installed, its Bash completion modules are loaded.
  BREW_PREFIX=$(brew --prefix)

  if [[ -n "$BREW_PREFIX" ]]; then
    # To enable bash_completion in macos
    if [[ -f "$BREW_PREFIX"/share/bash-completion/bash_completion ]] && [[ "$(GET_BASH_MAJOR_VERSION)" == 4 ]]; then
      # bash-completion2
      BASH_COMPLETION_FILE="$BREW_PREFIX"/share/bash-completion/bash_completion
    elif [[ -f "$BREW_PREFIX"/etc/bash_completion ]]; then
      # bash-completion
      BASH_COMPLETION_FILE="$BREW_PREFIX"/etc/bash_completion
    fi
  fi
else
  # Loads the system's Bash completion modules.
  if [[ -f /etc/bash_completion ]]; then
    BASH_COMPLETION_FILE=/etc/bash_completion
  elif [[ -f /etc/profile.d/bash_completion.sh ]]; then
    # Some distribution makes use of a profile.d script to import completion.
    BASH_COMPLETION_FILE=/etc/profile.d/bash_completion.sh
  else
    # check bash_completion in other system
    BASH_COMPLETION_FILE="/usr/share/bash-completion/bash_completion"
  fi
fi

if [[ -n "$BASH_COMPLETION_FILE" ]] && [[ -f "$BASH_COMPLETION_FILE" ]]; then
  # echo BASH_COMPLETION_FILE-----$BASH_COMPLETION_FILE
  source "$BASH_COMPLETION_FILE"
fi
