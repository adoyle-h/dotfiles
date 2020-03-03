if dotfiles_l.has_not function __prompt_append; then
  __prompt_check_precmd_conflict() {
    local f
    for f in "${precmd_functions[@]}"; do
      if [[ "${f}" == "${1}" ]]; then
        return 0
      fi
    done
    return 1
  }

  # Copy from bash-it. https://github.com/Bash-it/bash-it/blob/master/themes/base.theme.bash
  __prompt_append() {
    local prompt_re

    if [ "${__bp_imported:-}" == "defined" ]; then
      # We are using bash-preexec
      if ! __prompt_check_precmd_conflict "${1}" ; then
        precmd_functions+=("${1}")
      fi
    else
      # Set OS dependent exact match regular expression
      if [[ ${OSTYPE} == darwin* ]]; then
        # macOS
        prompt_re="[[:<:]]${1}[[:>:]]"
      else
        # Linux, FreeBSD, etc.
        prompt_re="\\<${1}\\>"
      fi

      if [[ ${PROMPT_COMMAND:-} =~ ${prompt_re} ]]; then
        return
      elif [[ -z ${PROMPT_COMMAND:-} ]]; then
        PROMPT_COMMAND="${1}"
      else
        PROMPT_COMMAND="${1};${PROMPT_COMMAND}"
      fi
    fi
  }
fi
