# BASH_IT_LOAD_PRIORITY: 180
cite about-plugin
about-plugin 'Use gnu tools instead of default commands for MacOS'

if dotfiles_l.has command gdate; then
  # GNU File, Shell, and Text utilities for mac. Depend on "brew install coreutils"
  alias date='gdate'
  alias timeout='gtimeout'
  alias truncate='gtruncate'
else
  echo "WARNING: Not found gdate. You should install coreutils before enable gnutools-for-mac.plugin.bash. Try 'brew install coreutils'." >&2
fi
