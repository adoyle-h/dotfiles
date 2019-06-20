# BASH_IT_LOAD_PRIORITY: 180
cite about-plugin
about-plugin 'My "sub" command entry.'

# Do not modify SUB_NAME!
export SUB_NAME="a"
export SUB_BIN_DIR="$HOME/bin/sub"
SUB_COMPLETION_FILE="$(dirname "${BASH_SOURCE[0]}")/../available/sub/sub.completion.bash"

if [[ -f "$SUB_COMPLETION_FILE" ]]; then
  # shellcheck source=./sub/completions
  source "${SUB_COMPLETION_FILE}"
fi
