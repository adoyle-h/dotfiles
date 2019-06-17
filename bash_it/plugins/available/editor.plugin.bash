# BASH_IT_LOAD_PRIORITY: 301
cite about-plugin
about-plugin 'Set favorite editor in terminal'

if has command nvim; then
  export VISUAL='nvim'
else
  export VISUAL='vim'
fi

export EDITOR="$VISUAL"
