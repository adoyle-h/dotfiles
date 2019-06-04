# BASH_IT_LOAD_PRIORITY: 180
cite about-plugin
about-plugin 'My "sub" command entry.'

export SUB_NAME="a"
export SUB_BIN_DIR="$HOME/bin/sub"
export SUB_COMPLETION_FILE="$(dirname "${BASH_SOURCE[0]}")/../available/sub/sub.completion.bash"
eval "$("$(dirname "${BASH_SOURCE[0]}")"/../available/sub/init)"
