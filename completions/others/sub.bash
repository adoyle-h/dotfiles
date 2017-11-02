_comp_sub() {
  COMPREPLY=()
  local word="${COMP_WORDS[COMP_CWORD]}"

  if [ "$COMP_CWORD" -eq 1 ]; then
    COMPREPLY=( $(compgen -W "$("$SUB_NAME" commands)" -- "$word") )
  else
    local command="${COMP_WORDS[1]}"
    local completions="$("$SUB_NAME" completions "$command")"
    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
  fi
}

complete -F _comp_sub "$SUB_NAME"
