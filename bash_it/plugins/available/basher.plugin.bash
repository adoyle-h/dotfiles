cite about-plugin
about-plugin 'Init basher. https://github.com/basherpm/basher'

if dotfiles_l.has_not command basher; then
  echo "Not found command 'basher" >&2
  echo "WARNING: Invoke 'a plugins-disable basher' to disable the plugin" >&2
  return 0
fi

BASHER_FULL_CLONE=false
# BASHER_PREFIX=$HOME/.basher/cellar

source <(basher init -)
