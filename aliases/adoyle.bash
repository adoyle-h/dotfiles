cite about-plugin
about-plugin 'ADoyle style aliases'

if dotfiles_l.has command massren; then
  alias rename-files='massren'
fi

alias tm='tmux attach-session -t "work" || tmux new-session -s "work" -d -n "main"'
