# shellcheck disable=SC1090
cite about-plugin
about-plugin 'Settings for fzf; https://github.com/junegunn/fzf'

if [[ -d /usr/local/opt/fzf ]]; then
  FZF_DIR=/usr/local/opt/fzf
  FZF_BIN=$FZF_DIR/bin
  FZF_MANPATH=$FZF_DIR/share/man
elif [[ -d /opt/homebrew/opt/fzf ]]; then
  FZF_DIR=/opt/homebrew/opt/fzf
  FZF_BIN=$FZF_DIR/bin
  FZF_MANPATH=$FZF_DIR/share/man
elif [[ -d $HOME/.fzf/bin ]]; then
  FZF_DIR=$HOME/.fzf
  FZF_BIN=$FZF_DIR/bin
  FZF_MANPATH=$FZF_DIR/man
else
  echo "Not found fzf directory. Please install fzf by git or homebrew, see https://github.com/junegunn/fzf#installation" >&2
  echo "Invoke 'a plugins-disable fzf' to disable the plugin"
  return 1
fi

if dotfiles_l.has_not command fzf; then
  export PATH="$PATH:$FZF_BIN"
fi

if ! man -w fzf &>/dev/null; then
  export MANPATH="$MANPATH:$FZF_MANPATH"
fi

if dotfiles_l.has_not command fzf; then
  echo "Not found command 'fzf'" >&2
  echo "Invoke 'a plugins-disable fzf' to disable the plugin"
  return 1
fi

# ---- BASIC ----
FZF_COLORS='--color=light,hl:196,hl+:196,fg+:255,bg+:238,prompt:33,pointer:255,marker:160,info:252,spinner:237,header:75 --ansi --black'
FZF_PROMPT="--prompt='> '"
FZF_KEYBINDS="--bind=\
left:page-up,\
right:page-down,\
ctrl-t:toggle-all,\
ctrl-n:page-down,\
ctrl-p:page-up,\
alt-j:jump,\
esc:deselect-all,\
?:toggle-preview\
"

# ---- PREVIEW ----
FZF_CTRL_T_PREVIEW="--preview '(cat {} || tree -CF {}) 2> /dev/null | head -200'"
FZF_CTRL_R_PREVIEW=""
FZF_ALT_C_PREVIEW="--preview 'tree -C {} | head -200'"

# ---- CATEGORY ----
FZF_SEARCH_MODE='--extended'
FZF_SEARCH_RESULT='--sort --tiebreak=begin,length'
FZF_INTERFACE="${FZF_KEYBINDS} --multi"
FZF_LAYOUT="--height=50% --min-height=1 --inline-info ${FZF_PROMPT}"
FZF_DISPLAY="${FZF_COLORS}"
FZF_SCRIPTING="--select-1 --exit-0"

export FZF_DEFAULT_OPTS="${FZF_SEARCH_MODE} ${FZF_SEARCH_RESULT} ${FZF_INTERFACE} ${FZF_DISPLAY} ${FZF_LAYOUT} ${FZF_SCRIPTING}"
export FZF_DEFAULT_COMMAND='ag -l --ignore-dir node_modules --ignore-dir .git -g ""'
# export FZF_CTRL_T_COMMAND="ls"
export FZF_CTRL_T_OPTS="${FZF_DEFAULT_OPTS} --header='[Files]' ${FZF_CTRL_T_PREVIEW}"
export FZF_CTRL_R_OPTS="${FZF_DEFAULT_OPTS} --header='[History]' --tiebreak=index ${FZF_CTRL_R_PREVIEW}"
export FZF_ALT_C_OPTS="${FZF_DEFAULT_OPTS} --header='[Checkout Directory]' ${FZF_ALT_C_PREVIEW}"
export FZF_COMPLETION_TRIGGER='**'

if [[ -n "$TMUX" ]]; then
  export FZF_TMUX=1
  export FZF_TMUX_HEIGHT=50%
fi

# Key bindings
source "$FZF_DIR/shell/key-bindings.bash"
# bind __fzf_cd__ from ALT-C to ALT-T
bind -m emacs-standard '"\et": " \C-e\C-u`__fzf_cd__`\e\C-e\er\C-m"'
# bind ALT-C to capitalize-word (follow emacs bindings style)
bind -m emacs-standard '"\ec": capitalize-word'

# Auto-completion
source "$FZF_DIR/shell/completion.bash" 2> /dev/null

unset -v FZF_DIR FZF_MANPATH FZF_BIN

## support neo (nvim) bash-completion
complete -F _fzf_file_completion -o default -o bashdefault neo
complete -F _fzf_file_completion -o default -o bashdefault nvim
