# shellcheck disable=SC1090

cite about-plugin
about-plugin 'Enable fzf'

FZF_SCRIPT="${HOME}/.fzf.bash"

export FZF_DEFAULT_OPTS='--select-1 --tiebreak begin --inline-info --ansi --multi -x --color=light,hl:196,hl+:196,fg+:255,bg+:238,prompt:39,pointer:39,marker:160,info:252 --bind=left:page-up,right:page-down,ctrl-t:toggle-all,esc:deselect-all --toggle-sort \`'
export FZF_DEFAULT_COMMAND='ag -l -g ""'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_COMMAND="ls"
export FZF_COMPLETION_TRIGGER='='

[[ -f "$FZF_SCRIPT" ]] && source "$FZF_SCRIPT"

unset -v FZF_SCRIPT
