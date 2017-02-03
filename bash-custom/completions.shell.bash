# shellcheck disable=SC1090,SC1091

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
