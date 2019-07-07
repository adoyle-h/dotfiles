# shellcheck disable=SC2139
cite about-plugin
about-plugin 'nvim settings'

if dotfiles_l.has_not command nvim; then
  echo 'WARNING: nvim not found. But you have enabled nvim.plugin.bash.' >&2
  return
fi

export NVIM_HOME="$XDG_CONFIG_HOME/nvim"
export VISUAL='nvim'

alias neo="$VISUAL"
alias edit="$VISUAL"
alias pager="$VISUAL"
