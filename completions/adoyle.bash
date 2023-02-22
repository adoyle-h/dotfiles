# ONE_LOAD_PRIORITY: 900

if one_l.has command adoyle; then
  source <(adoyle completion bash)
fi

complete -F _nvim_completions -o bashdefault neo

_with-proxy_completions() {
  # shellcheck disable=2034
  local cur prev words cword split comp_args

  if type _comp_initialize &>/dev/null; then
    # _comp_initialize is defined in bash-completion
    # https://github.com/scop/bash-completion/blob/5927d5733be672268ae15e78fd3b1a5d91cfbc2d/completions/sudo#L6
    _comp_initialize -s -- "$@" || return

    # https://github.com/scop/bash-completion/blob/5927d5733be672268ae15e78fd3b1a5d91cfbc2d/bash_completion#LL2280
    _comp_command_offset 1
  elif type _init_completion &>/dev/null; then
    # _init_completion is the previous version of _comp_initialize
    # https://github.com/scop/bash-completion/blob/6f1bbda3c66814befa8025d49363b4070ef20008/completions/sudo#L6
    # https://github.com/scop/bash-completion/blob/5927d5733be672268ae15e78fd3b1a5d91cfbc2d/bash_completion#L1130
    _init_completion -s || return

    # https://github.com/scop/bash-completion/blob/6f1bbda3c66814befa8025d49363b4070ef20008/bash_completion#L2123
    _command_offset 1
  else
    echo "You must install https://github.com/scop/bash-completion/" >&2
    return 0
  fi
}

complete -F _with-proxy_completions with-proxy
