_comp_sub() {
  COMPREPLY=()
  local word="${COMP_WORDS[COMP_CWORD]}"
  local SCRIPT_DIR completions
  SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")

  if [ "$COMP_CWORD" -eq 1 ]; then
    completions=$("$SUB_BIN_DIR"/commands)
  else
    local command="${COMP_WORDS[1]}"
    completions=$(COMP_CWORD="$COMP_CWORD" "$SCRIPT_DIR"/completions "$command" "${COMP_WORDS[@]:2}")
  fi

  COMPREPLY=( $(compgen -W "${completions}" -- "$word") )
}

complete -F _comp_sub "$SUB_NAME"
