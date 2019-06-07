cite about-plugin
about-plugin 'Enable npm completion'

if has command npm; then
  eval "$(npm completion)"
fi
