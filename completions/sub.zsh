if [[ ! -o interactive ]]; then
    return
fi

compctl -K _sub "$SUB_NAME"

_sub() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$("$SUB_NAME" commands)"
  else
    completions="$("$SUB_NAME" completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
