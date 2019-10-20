# shellcheck disable=SC1090
# BASH_IT_LOAD_PRIORITY: 200
cite about-plugin
about-plugin 'change node source code mirror and enable nvm'

# NVM_NODEJS_ORG_MIRROR is deprecated and will be removed in node-gyp v4, please use NODEJS_ORG_MIRROR
export NODEJS_ORG_MIRROR="https://npm.taobao.org/mirrors/node"
export NVM_NODEJS_ORG_MIRROR="$NODEJS_ORG_MIRROR"
DEFAULT_NODE_VERSION=v10.15.0

BREW_PREFIX=$(brew --prefix)
if dotfiles_l.has command brew && [[ -d "$BREW_PREFIX/Cellar/nvm" ]]; then
  # brew --prefix <formula> is slow
  # https://github.com/Homebrew/brew/issues/3097#issuecomment-325206329
  brew_nvm_prefix="$(brew --prefix nvm)"
  if [[ -s $brew_nvm_prefix/nvm.sh ]]; then
    export NVM_DIR=$brew_nvm_prefix
  fi
  unset -v brew_nvm_prefix
fi
unset -v BREW_PREFIX

if [[ -z $NVM_DIR ]] && [[ -d $HOME/.nvm ]]; then
  export NVM_DIR=$HOME/.nvm
fi

my_nvm() {
  unalias nvm
  . "$NVM_DIR/nvm.sh"
  nvm "$@"
}

if [[ -n "$NVM_DIR" ]]; then
  DOTFILES_DEBUG "source $NVM_DIR/nvm.sh"
  # . "$NVM_DIR/nvm.sh"

  # add our default nvm node (`nvm alias default 10.16.0`) to path without loading nvm
  export PATH="$NVM_DIR/versions/node/$DEFAULT_NODE_VERSION/bin:$PATH"
  # alias `nvm` to this one liner lazy load of the normal nvm script
  alias nvm=my_nvm

  # Enable nvm completion
  [[ -r "$NVM_DIR"/bash_completion ]] && . "$NVM_DIR"/bash_completion
fi

if dotfiles_l.has_not the nvm; then
  echo 'WARNING: Shell function "nvm" not found. But you have enabled nvm.plugin.bash.' >&2
  echo '         You should install nvm by yourself. See https://github.com/creationix/nvm' >&2
  echo '         If you install nvm via brew. Check the path of "brew --prefix nvm".' >&2
  echo "         If you install nvm via curl. Check the path of \"$NVM_DIR/nvm.sh\"." >&2
fi
