# shellcheck disable=SC1090

# Be sure to initialize this script at last for avoiding problems

cite about-plugin
about-plugin 'A better "cd" for bash'
# https://github.com/spencertipping/cd

CD_EXTENSIONS=(traverse history)
CD_FILE="$HOME/.cd/core/cd"

if [[ -f "$CD_FILE" ]]; then
  source "$CD_FILE"
else
  echo "Not found file: $CD_FILE"
fi

unset -v CD_EXTENSIONS CD_FILE

_BASH_PLUGIN_ENABLED="CD;$_BASH_PLUGIN_ENABLED"
