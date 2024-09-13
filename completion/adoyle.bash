# ONE_LOAD_PRIORITY: 900

if one_l.has command adoyle; then
  source <(adoyle completion bash)
fi

# complete -o filenames -o bashdefault -F _eza ls ll l llm

complete -F _nvim_completions -o bashdefault neo
