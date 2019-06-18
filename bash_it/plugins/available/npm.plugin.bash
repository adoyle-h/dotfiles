cite about-plugin
about-plugin 'Enable npm completion'

if l.has command npm; then
  eval "$(npm completion)"
fi
