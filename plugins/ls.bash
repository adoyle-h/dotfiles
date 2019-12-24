cite about-plugin
about-plugin 'better ls commands. use https://github.com/ogham/exa'

if dotfiles_l.has command exa; then
  alias ls='exa -x'
  alias ll='exa -lahg --icons'
else
  if ls --color -d . &> /dev/null ; then
    alias ls='ls --color=auto'
  elif ls -G -d . &> /dev/null ; then
    alias ls='ls -G'        # Compact view, show colors
  else
    alias ls='ls -F'
  fi

  alias ll='ls -lahF'
fi
