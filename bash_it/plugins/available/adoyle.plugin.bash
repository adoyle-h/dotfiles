cite about-plugin
about-plugin 'A personal command for me (ADoyle). No meanings to other people.'

if has not command adoyle; then
  echo "Not found command 'adoyle'" >&2
  echo "WARNING: Invoke 'a disable-plugin adoyle' to disable the plugin" >&2
  return 0
fi

source <(adoyle completion bash)
