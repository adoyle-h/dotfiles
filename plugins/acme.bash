cite about-plugin
about-plugin 'Enable acme.sh. https://github.com/Neilpang/acme.sh'

[[ ! -f "$HOME/.acme.sh/acme.sh.env" ]] && return;

source "$HOME/.acme.sh/acme.sh.env"
alias acme.sh='~/.acme.sh/acme.sh'
