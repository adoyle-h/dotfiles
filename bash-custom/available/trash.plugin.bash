cite about-plugin
about-plugin 'An alternative to "rm" command. https://github.com/sindresorhus/trash'

if has not command trash; then
  echo "Not found command 'trash'" >&2
  echo "Invoke 'a disable-plugin trash' to disable the plugin"
  return 1
fi

alias rm='trash'
