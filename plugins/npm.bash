cite about-plugin
about-plugin 'Enable npm completion'

if dotfiles_l.has command npm; then
  eval "$(npm completion)"
fi

