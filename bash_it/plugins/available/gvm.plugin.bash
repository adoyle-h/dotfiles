# shellcheck disable=SC1090
cite about-plugin
about-plugin 'Enable gvm'

GVM_SCRIPT="${HOME}/.gvm/scripts/gvm"

[[ -f "$GVM_SCRIPT" ]] && source "$GVM_SCRIPT"

unset -v GVM_SCRIPT
