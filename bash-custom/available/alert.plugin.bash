cite about-plugin
about-plugin 'alert command'

if has command osascript; then
  alert() {
    local msg=$1
    osascript -e "display notification \"$msg\" with title \"Alert\""
  }
fi
