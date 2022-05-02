cite about-plugin
about-plugin 'Enable Fig auto-completion'

if dotfiles_l.has_not command fig; then
  echo "Not found command 'fig'" >&2
  echo "WARNING: Invoke 'a disable completion fig' to disable the plug" >&2
  return 0
fi

# Fig pre block. Keep at the top of this file.
export PATH="${PATH}:${HOME}/.local/bin"
eval "$(fig init bash pre)"

# .....

# Fig post block. Keep at the bottom of this file.
eval "$(fig init bash post)"
