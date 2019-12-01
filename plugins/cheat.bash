cite about-plugin
about-plugin 'https://github.com/cheat/cheat'

function cheat-fzf {
  eval `cheat -l | tail -n +2 | fzf | awk -v vars="$*" '{ print "cheat " $1 " -t " $3, vars }'`
}
