# BASH_IT_LOAD_PRIORITY: 399
# gvm plugin should be loaded before go plugin
cite about-plugin
about-plugin 'To load gvm script if installed'

GVM_SCRIPT=${HOME}/.gvm/scripts/gvm

# shellcheck disable=SC1090
[[ -f "$GVM_SCRIPT" ]] && source "$GVM_SCRIPT"

unset -v GVM_SCRIPT
