#!/usr/bin/env bash
# shellcheck disable=SC1090

set -o errexit
set -o nounset
set -o pipefail
[[ -n "${XTRACE:+x}" ]] && set -o xtrace
[[ -n "${VERBOSE:+x}" ]] && set -o verbose
[[ -n "${DEBUG:-}" ]] && IS_DEBUG=true || IS_DEBUG=false
[[ $- =~ [x] ]] && PS4='+[${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]:+${FUNCNAME[0]}}()]: '

ask() {
  local msg=$1
  read -rp "$msg? ([Y]/N)" answer
  case $answer in
    [Yy]* ) return 0;;
    [Nn]* ) return 1;;
    *) return 0;;
  esac
}

has() {
  local condition="$1"
  local value="$2"

  if [ "$condition" == "not" ]; then
    shift 1
    ! has "${@}"
    return $?
  fi

  case "$condition" in
    command)
      [[ -x "$(command -v "$value")" ]] && return 0;;
  esac > /dev/null

  return 1
}

check_uninstalled_cmd() {
  local cmd=$1
  if has not command "$cmd" ; then
    echo "command [$cmd] is not installed. ❌"
    return 0
  else
    echo "command [$cmd] is installed. ✅"
    return 1
  fi
}

_bootstrap_common() {
  echo '[Bootstrap in common]'

  echo 'To git clone submodules'
  git submodule init
  git submodule update

  echo 'To mkdir -p general work directories'
  mkdir -p ~/{Temp,Src,Workspace,Presentations,Design,Doc,Public,Pictures,Downloads}
  mkdir -p ~/.sshrc.d

  if [[ ! -d ~/.bash_it ]] ; then
    echo 'To download bash_it'
    git clone --depth 1 https://github.com/Bash-it/bash-it.git ~/.bash_it
  fi

  if [[ ! -d ~/dotfiles ]] ; then
    echo 'To download my dotfiles'
    git clone --depth 1 --recursive git@github.com:adoyle-h/dotfiles.git ~/dotfiles
    # ~/dotfiles/install
  fi

  if command -v nvm != 'nvm' ; then
    echo 'To install nvm'
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

    read -rp "To install NodeJS. Which version? (Defaults to node latest)" answer
    if [[ -z $answer ]]; then
      answer=node
    fi

    echo "To install node. nvm install $answer"
    nvm install $answer
  fi

  if ask 'To install taskbook'; then
    npm i -g taskbook
  else
    cat <<<EOF
      You can install taskbook in manually by "npm i -g taskbook"
    EOF
  fi

  if [[ ! -d ~/dotfiles/secrets ]] ; then
    echo 'To download my secrets'
    # git clone --depth 1  ~/dotfiles/secrets
  fi

  if check_uninstalled_cmd cheat ; then
    if ask 'To download my cheatsheet'; then
      echo 'To install cheat'
      pip install cheat
    fi
  fi

  if [[ ! -d ~/dotfiles/cheat ]] ; then
    if ask 'To download my cheatsheet'; then
      git clone --depth 1 git@github.com:adoyle-h/my-command-cheat.git ~/dotfiles/cheat
    fi
  fi

  if [[ ! -d ~/dotfiles/nvim ]] ; then
    if ask 'To install nvim'; then
      echo 'To download my nvim configuration'
      git clone --depth 1 git@github.com:adoyle-h/neovim-config.git ~/dotfiles/nvim
    fi
  fi

  if check_uninstalled_cmd fzf ; then
    if ask 'To install fzf'; then
      git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
      ~/.fzf/install
    else
      cat <<<EOF
        You can install fzf in manually by below commands.
        """
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
        """
      EOF
    fi
  fi

  if check_uninstalled_cmd grip ; then
    if ask 'To install grip'; then
      pip install grip
    fi
  fi

  ./install

  echo 'To setup bash-custom plugins'
  a enable-plugin $(cat ./bootstraps/recommends/custom_plugins)

  echo '[Done] Bootstrap in common'
}

_bootstrap_macos() {
  echo '[Bootstrap in macos]'

  if has not command brew ; then
    echo 'To install homebrew'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew bundle install

  echo '[Done] Bootstrap in macos'
}

_bootstrap_linux() {
  echo '[Bootstrap in linux]'
  echo '[Done] Bootstrap in linux'
}

if has command brew ; then
  _bootstrap_common
  _bootstrap_macos
else
  _bootstrap_common
  _bootstrap_linux
fi

unset -f has _bootstrap_common _bootstrap_macos _bootstrap_linux
