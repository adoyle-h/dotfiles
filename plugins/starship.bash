cite about-plugin
about-plugin 'Cool shell prompt. https://starship.rs/'

if dotfiles_l.has_not command starship; then
  echo 'WARNING: starship not found. But you have enabled starship.plugin.bash.' >&2
  return 0
fi

eval "$(starship init bash)"
