cite about-plugin
about-plugin 'A alias to query man page for bash builtin usages'

bashman () { man bash | less -p "^       $1 "; }
alias manbash=bashman
