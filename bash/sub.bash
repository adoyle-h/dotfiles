if [[ -n ${DOTFILES_SUB:-} ]]; then
  # shellcheck disable=SC2139
  alias "$DOTFILES_SUB"="$DOTFILES_DIR"/bin/sub-bin
else
  DOTFILES_SUB=sub-bin
fi

export SUB_NAME="$DOTFILES_SUB"
export SUB_BIN_DIR="$HOME/bin/sub"

_comp_sub() {
  COMPREPLY=()
  local word="${COMP_WORDS[COMP_CWORD]}"
  local completions
  local completion_bin="$DOTFILES_DIR"/bin/sub-completions

  if [[ "$COMP_CWORD" -eq 1 ]]; then
    completions=$("$SUB_BIN_DIR"/commands)
  else
    local command="${COMP_WORDS[1]}"
    completions=$(COMP_CWORD="$COMP_CWORD" "$completion_bin" "$command" "${COMP_WORDS[@]:2}")
  fi

  COMPREPLY=( $(compgen -W "${completions}" -- "$word") )
}

complete -F _comp_sub "$SUB_NAME"
