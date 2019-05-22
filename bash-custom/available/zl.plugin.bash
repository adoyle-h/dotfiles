cite about-plugin
about-plugin 'Initialize z command. https://github.com/skywind3000/z.lua'

if [[ ! -f $DOTFILE_DIR/pkgs/z.lua/z.lua ]]; then
  return 0
fi

export _ZL_CMD=j
export _ZL_DATA=$HOME/.z_lua
# export _ZL_NO_PROMPT_COMMAND=true
export _ZL_EXCLUDE_DIRS=(.git)
# export _ZL_CD=cd
export _ZL_MATCH_MODE=1

eval "$(lua "$DOTFILE_DIR"/pkgs/z.lua/z.lua --init bash fzf)"

alias ju='j -b'      # cd to the parent directory starting with foo
alias jl='j -l foo'  # list matches instead of cd
alias jc='j -c'      # restrict matches to subdirs of $PWD
alias jz='j -i'      # cd with interactive selection
alias jf='j -I'      # cd with interactive selection using fzf
alias jb='j -t -I .' # go back to last directory
