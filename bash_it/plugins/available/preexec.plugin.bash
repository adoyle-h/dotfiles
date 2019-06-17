# BASH_IT_LOAD_PRIORITY: 150
cite about-plugin
about-plugin 'Enable bash-preexec. https://github.com/rcaloras/bash-preexec'

TARGET=$(dirname "${BASH_SOURCE[0]}")/../../../pkgs/bash-preexec/bash-preexec.sh

if [[ ! -f $TARGET ]]; then
  echo 'WARNING: submodule pkgs/bash-preexec not found. But you have enabled preexec.plugin.bash.' >&2
  echo "         TARGET: ${TARGET}" >&2
  unset TARGET
  return 0
fi

# shellcheck source=../../../pkgs/bash-preexec/bash-preexec.sh
source "$TARGET"

unset TARGET
