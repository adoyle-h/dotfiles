cite about-plugin
about-plugin 'Enable GNU utilities for Mac'

if dotfiles_l.has_not command gdate; then
  echo "WARNING: Not found gdate. You should install coreutils before enable gnu.plugin.bash. Try brew install coreutils." >&2
  return 0
fi

# PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# GNU File, Shell, and Text utilities for mac
# depend on: brew install coreutils
alias date='gdate'
alias timeout='gtimeout'
alias truncate='gtruncate'
