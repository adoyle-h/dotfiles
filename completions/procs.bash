_procs() {
    local i cur prev opts cmds
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd=""
    opts=""

    for i in ${COMP_WORDS[@]}
    do
        case "${i}" in
            procs)
                cmd="procs"
                ;;

            *)
                ;;
        esac
    done

    case "${cmd}" in
        procs)
            opts=" -a -o -d -r -l -t -w -h -V -W -i -c -p  --and --or --nand --nor --list --tree --watch --config --no-header --debug --help --version --watch-interval --insert --only --sorta --sortd --color --pager --interval --completion  <KEYWORD>... "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in

                --watch-interval)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -W)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --insert)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                    -i)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --only)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sorta)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --sortd)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --color)
                    COMPREPLY=($(compgen -W "auto always disable" -- "${cur}"))
                    return 0
                    ;;
                    -c)
                    COMPREPLY=($(compgen -W "auto always disable" -- "${cur}"))
                    return 0
                    ;;
                --pager)
                    COMPREPLY=($(compgen -W "auto always disable" -- "${cur}"))
                    return 0
                    ;;
                    -p)
                    COMPREPLY=($(compgen -W "auto always disable" -- "${cur}"))
                    return 0
                    ;;
                --interval)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --completion)
                    COMPREPLY=($(compgen -W "zsh bash fish powershell elvish" -- "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;

    esac
}

complete -F _procs -o bashdefault -o default procs
