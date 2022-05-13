cite about-plugin
about-plugin 'Some more alias to avoid making mistakes'

if dotfiles_l.has command trash; then
  # Safe "rm" command. Use trash if it exists. https://github.com/sindresorhus/trash
  alias rm='trash'
else
  alias rm='rm -i'
fi

alias cp='cp -i'
alias mv='mv -i'
