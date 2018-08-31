# shellcheck disable=SC1090

cite about-plugin
about-plugin 'cd command with an interactive filter. Use https://github.com/b4b4r07/enhancd'

[[ ! -f "${DOTFILE_DIR}/tools/enhancd/init.sh" ]] && return 1

export ENHANCD_COMMAND=c
export ENHANCD_DISABLE_DOT=1
source "${DOTFILE_DIR}"/tools/enhancd/init.sh
