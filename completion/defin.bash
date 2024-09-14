about-plugin 'Enable defin auto-completion'
one-bash:mod:deps defin

###-begin-defin-completions-###
#
# yargs command completion script
#
_defin_completions() {
  local cur_word args type_list

  cur_word="${COMP_WORDS[COMP_CWORD]}"
  args=("${COMP_WORDS[@]}")

  # ask yargs to generate completions.
  type_list=$(defin --get-yargs-completions "${args[@]}")

  COMPREPLY=($(compgen -W "${type_list}" -- ${cur_word}))

  # if no match was found, fall back to filename completion
  if [ ${#COMPREPLY[@]} -eq 0 ]; then
    COMPREPLY=()
  fi

  return 0
}
complete -o default -F _defin_completions defin
###-end-defin-completions-###
