# Setup fzf
# ---------

FZF_MANPATH=$HOME/.fzf/man
FZF_BIN=$HOME/.fzf/bin

__no_matched_path() {
  case ":${2}:" in
    *:${1}:*) return 1;;
    *) return 0;;
  esac
}

if __no_matched_path "$FZF_BIN" "$PATH" ; then
  export PATH="$PATH:$FZF_BIN"
fi

if __no_matched_path "$FZF_MANPATH" "$MANPATH"; then
  export MANPATH="$MANPATH:$FZF_MANPATH"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.bash"
