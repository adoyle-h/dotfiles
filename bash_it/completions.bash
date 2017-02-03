#!/usr/bin/env bash
# shellcheck disable=SC1090

# System completion should be first

if command -v brew &>/dev/null ; then
  # If Homebrew is installed, its Bash completion modules are loaded.
  BREW_PREFIX=$(brew --prefix)

  if [[ -n "$BREW_PREFIX" ]]; then
    # To enable bash_completion in macos
    BASH_COMPLETION_FILE="$BREW_PREFIX/share/bash-completion/bash_completion"

    if [ -f "$BREW_PREFIX"/share/bash-completion/bash_completion ]; then
      # bash-completion2
      BASH_COMPLETION_FILE="$BREW_PREFIX"/share/bash-completion/bash_completion
    elif [ -f "$BREW_PREFIX"/etc/bash_completion ]; then
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
  source "$BASH_COMPLETION_FILE"
fi
