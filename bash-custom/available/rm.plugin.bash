cite about-plugin
about-plugin 'A better "rm" command. Use trash if it exists. https://github.com/sindresorhus/trash'

if has command trash; then
  alias rm='trash'
else
  alias rm='rm -i'
fi
