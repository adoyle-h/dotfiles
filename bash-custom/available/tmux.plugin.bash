cite about-plugin
about-plugin 'Tmux pre-settings'

alias tm='tmux attach-session -t "work" || tmux new-session -s "work" -d -n "main"'

[[ -z "$TMUX" ]] && export TMUX
