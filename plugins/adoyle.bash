cite about-plugin
about-plugin 'A personal settings for myself (ADoyle). No meanings to other people.'

if dotfiles_l.has command adoyle; then
  source <(adoyle completion bash)
fi

if dotfiles_l.has command massren; then
  alias rename-files='massren'
fi

alias tm='if [ -z $TMUX ]; then tmux -CC new-session -A -s "work" -n "main"; fi'

# export HOMEBREW_AUTO_UPDATE_SECS=86400 # 1 day
export HOMEBREW_NO_AUTO_UPDATE=1
