cite about-plugin
about-plugin 'bash completion for https://github.com/adoyle-h/iThoughts-Search'

if has not command itmz; then
  echo "Not found command 'itmz'" >&2
  echo "Invoke 'a disable-plugin itmz' to disable the plugin"
  return 1
fi

source <(itmz --completion)
