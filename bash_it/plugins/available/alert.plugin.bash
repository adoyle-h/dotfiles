cite about-plugin
about-plugin 'Add an alert function'

if has command osascript; then
  alert() {
    local msg=$1
    osascript -e "display notification \"$msg\" with title \"Alert\""
  }
fi
