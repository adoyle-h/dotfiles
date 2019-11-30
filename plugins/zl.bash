cite about-plugin
about-plugin 'Initialize z command. https://github.com/skywind3000/z.lua.'

z_lua_file=$DOTFILES_DIR/deps/z.lua/z.lua
if [[ ! -f $z_lua_file ]]; then
  echo 'WARNING: deps/z.lua not found. But you have enabled zl.plugin.bash.' >&2
  unset z_lua_file
  return 0
fi

export _ZL_CMD=j
export _ZL_DATA=$HOME/.z_lua
export _ZL_NO_PROMPT_COMMAND=true
export _ZL_EXCLUDE_DIRS=(.git)
# export _ZL_CD=cd
export _ZL_MATCH_MODE=1


z_lua_init_options=(bash)
if dotfiles_l.has command fzf; then
  z_lua_init_options+=(fzf)
fi

eval "$(lua "$z_lua_file" --init "${z_lua_init_options[@]}")"
unset z_lua_file

_z_lua_add_path() {
  (_zlua --add "$(command pwd 2>/dev/null)" &)
}

# fix ZL_PROMPT_COMMAND
__prompt_append _z_lua_add_path

alias ju='j -b'      # cd to the parent directory starting with foo
alias jl='j -l foo'  # list matches instead of cd
alias jc='j -c'      # restrict matches to subdirs of $PWD
alias jz='j -i'      # cd with interactive selection
alias jf='j -I'      # cd with interactive selection using fzf
alias jb='j -t -I .' # go back to last directory
