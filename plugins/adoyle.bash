cite about-plugin
about-plugin 'A personal settings for myself (ADoyle). No meanings to other people.'

if dotfiles_l.has_not command adoyle; then
  echo "Not found command 'adoyle'" >&2
  echo "WARNING: Invoke 'a plugins-disable adoyle' to disable the plugin" >&2
  return 0
fi

source <(adoyle completion bash)

# 1 day
export HOMEBREW_AUTO_UPDATE_SECS=86400
# export HOMEBREW_NO_AUTO_UPDATE=true
