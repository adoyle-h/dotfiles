_comp_sub() {
  COMPREPLY=()
  local word="${COMP_WORDS[COMP_CWORD]}"

  if [ "$COMP_CWORD" -eq 1 ]; then
    COMPREPLY=( $(compgen -W "$(COMP_CWORD="$COMP_CWORD" "$SUB_NAME" commands)" -- "$word") )
  else
    local command="${COMP_WORDS[1]}"
    local completions="$(COMP_CWORD="$COMP_CWORD" "$SUB_NAME" completions "$command" "${COMP_WORDS[@]:2}")"
    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
  fi
}

complete -F _comp_sub "$SUB_NAME"
