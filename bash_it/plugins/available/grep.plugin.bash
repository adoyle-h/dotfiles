cite about-plugin
about-plugin 'Enable grep color and modify grep settings'

# colored grep
if echo 'a' | grep --color=auto 'a' &> /dev/null; then
  alias grep='grep --color=auto'
fi

# https://www.gnu.org/software/grep/manual/html_node/Environment-Variables.html
# export GREP_COLOR='01;31'
# export GREP_COLORS='ms=01;31:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36'
