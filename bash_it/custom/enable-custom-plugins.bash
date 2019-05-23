CUSTOM_ENABLED="${DOTFILE_DIR}/bash_it/plugins/enabled/*.bash"

for config_file in $CUSTOM_ENABLED; do
  if [[ -f "${config_file}" ]]; then
    # shellcheck disable=SC1090
    source "$config_file"
  fi
done

unset config_file CUSTOM_ENABLED
