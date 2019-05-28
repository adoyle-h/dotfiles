# PLUGIN_WEIGHT: 200
cite about-plugin
about-plugin 'change node source code mirror and enable nvm'

# NVM_NODEJS_ORG_MIRROR is deprecated and will be removed in node-gyp v4, please use NODEJS_ORG_MIRROR
export NODEJS_ORG_MIRROR="https://npm.taobao.org/mirrors/node"
export NVM_NODEJS_ORG_MIRROR="$NODEJS_ORG_MIRROR"

brew_nvm_prefix="$(brew --prefix nvm)"
if has command brew && [[ -s $brew_nvm_prefix/nvm.sh ]]; then
  export NVM_DIR=$brew_nvm_prefix
  . "$brew_nvm_prefix"/nvm.sh
  unset brew_nvm_prefix
elif [[ -s ${NVM_DIR:-$HOME/.nvm} ]]; then
  export NVM_DIR=${NVM_DIR:-$HOME/.nvm}
  . "$NVM_DIR/nvm.sh"
fi

if [[ -n "$NVM_DIR" ]] && [[ -r "$NVM_DIR"/bash_completion ]]; then
  . "$NVM_DIR"/bash_completion
fi

if has not function nvm; then
  echo 'WARNING: Shell function "nvm" not found. But you have enabled nvm.plugin.bash.' >&2
  echo '         You should install nvm by yourself. See https://github.com/creationix/nvm' >&2
  echo '         If you install nvm via brew. Check the path of "brew --prefix nvm".' >&2
  echo "         If you install nvm via curl. Check the path of \"$NVM_DIR/nvm.sh\"." >&2
fi
