cite about-plugin
about-plugin 'https://github.com/direnv/direnv'

_CMD=direnv
if dotfiles_l.has_not command $_CMD; then
  echo "Not found command '$_CMD" >&2
  echo "WARNING: Invoke 'a disable-plugin $_CMD' to disable the plugin" >&2
  unset _CMD
  return 0
fi

_direnv_hook() {
  local previous_exit_status=$?;
  eval "$(direnv export bash)";
  return $previous_exit_status;
}

__prompt_append _direnv_hook

unset _CMD
