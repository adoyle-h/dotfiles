cite about-plugin
about-plugin 'Safe "rm" command. Use trash if it exists. https://github.com/sindresorhus/trash'

if l.has command trash; then
  alias rm='trash'
else
  alias rm='rm -i'
fi
