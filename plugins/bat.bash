cite about-plugin
about-plugin 'Better cat. https://github.com/sharkdp/bat'

if dotfiles_l.has_not command bat; then
  echo "Not found command 'bat" >&2
  echo "WARNING: Invoke 'a plugins-disable bat' to disable the plugin" >&2
  return 0
fi

alias c='bat'
