_crictl_cli_bash_autocomplete() {
    local cur opts base
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts="attach
create
exec
version
images
image
img
inspect
inspecti
imagefsinfo
inspectp
logs
port-forward
ps
pull
run
runp
rm
rmi
rmp
pods
start
info
stop
stopp
update
config
stats
completion
help
h
--config
--debug
--image-endpoint
--runtime-endpoint
--timeout
--help
--version"
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}

complete -F _crictl_cli_bash_autocomplete crictl
