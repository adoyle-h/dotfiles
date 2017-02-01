# shellcheck disable=SC1090,SC1091

if [[ ! -z "$BREW_PREFIX" ]]; then
  # To enable bash_completion in macos
  BASH_COMPLETION_FILE="$BREW_PREFIX/share/bash-completion/bash_completion"
else
  # To enable bash_completion in other system
  BASH_COMPLETION_FILE="/usr/share/bash-completion/bash_completion"
fi
[[ -f "$BASH_COMPLETION_FILE" ]] && source "$BASH_COMPLETION_FILE"

if [[ -x "$(command -v gulp)" ]]; then
  eval "$(gulp --completion=bash)"
fi

PM2_COMPLETION_FILE=$HOME/.completions/pm2-completion.sh
if [[ -f "$PM2_COMPLETION_FILE" ]]; then
  source "$PM2_COMPLETION_FILE"
fi

complete -F _bash-it-comp bit
complete -F _docker_machine dm

unset -v PM2_COMPLETION_FILE BASH_COMPLETION_FILE
