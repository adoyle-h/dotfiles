cite about-plugin
about-plugin 'A command for personal usage'

if has not command adoyle; then
  echo "Not found command 'adoyle'" >&2
  echo "Invoke 'a disable-plugin adoyle' to disable the plugin"
  return 1
fi

source <(adoyle completion bash)
