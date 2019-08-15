# Source: https://gist.github.com/bobbyrullo/69d4f0e25541f89c88ab

#  Completion for gvm:
#
_gvm_get_list()
{
   gvm $1 | grep "=>\|   " | cut -c 4-
}

_gvm_versions()
{
    _gvm_get_list list
}

_gvm_pkgsets()
{
    _gvm_get_list "pkgset list"
}

_gvm_all_versions()
{
    _gvm_get_list "listall"
}


_gvm()
{
    local cur prev opts pgkset_opts os arch
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="version get use diff implode install uninstall cross linkthis list listall alias pkgset pkgenv"
    pkgset_opts="create delete use empty list"
    os="linux darwin windows"
    arch="amd64 386 arm"

    case "$COMP_CWORD" in
        2)
            case "${prev}" in
    	        use)
	            COMPREPLY=( $(compgen -W "$(_gvm_versions)" -- ${cur}) )
                    return 0
                    ;;
    	        uninstall)
	            COMPREPLY=( $(compgen -W "$(_gvm_versions)" -- ${cur}) )
                    return 0
                    ;;
                pkgset)
                    COMPREPLY=( $(compgen -W "${pkgset_opts}" -- ${cur}) )
                    return 0
                    ;;
                install)
                    COMPREPLY=( $(compgen -W "$(_gvm_all_versions)" -- ${cur}) )
                    return 0
                    ;;
                cross)
                    COMPREPLY=( $(compgen -W "${os}" -- ${cur}) )
                    return 0
                    ;;
            esac
            ;;
        3)
            local prev_prev
            prev_prev="${COMP_WORDS[COMP_CWORD-2]}"
            case "${prev_prev}" in
                pkgset)
                    case "${prev}" in
                        use)
                            COMPREPLY=( $(compgen -W "$(_gvm_pkgsets)" -- ${cur}) )
                            return 0
                        ;;
                        delete)
                            COMPREPLY=( $(compgen -W "$(_gvm_pkgsets)" -- ${cur}) )
                            return 0
                        ;;
                    esac
                    ;;
                cross)
                    COMPREPLY=( $(compgen -W "${arch}" -- ${cur}) )
                    return 0
                    ;;
            esac
    esac

    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
}
complete -F _gvm gvm
