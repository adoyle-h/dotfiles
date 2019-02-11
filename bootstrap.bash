#!/usr/bin/env bash
# shellcheck disable=SC1090
set -o errexit
set -o nounset

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

_bootstrap_common() {
  echo '[Bootstrap in common]'

  echo 'To mkdir -p'
    mkdir -p ~/{Temp,Src,Workspace,Presentations,Design,Doc,Public,Pictures,Downloads}
    mkdir -p ~/.sshrc.d

  if [[ ! -d ~/.bash_it ]] ; then
    echo 'To download bash_it'
    git clone --depth 1 https://github.com/Bash-it/bash-it.git ~/.bash_it
  fi

  if command -v nvm != 'nvm' ; then
    echo 'To install nvm'
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
  fi

  if [[ ! -d ~/dotfiles ]] ; then
    echo 'To download my dotfiles'
    git clone --depth 1 --recursive git@github.com:adoyle-h/dotfiles.git ~/dotfiles
    # ~/dotfiles/install
  fi

  if [[ ! -d ~/dotfiles/secrets ]] ; then
    echo 'To download my secrets'
    # git clone --depth 1  ~/dotfiles/secrets
  fi

  if [[ ! -d ~/dotfiles/cheat ]] ; then
    echo 'To download my cheatsheet'
    git clone --depth 1 git@github.com:adoyle-h/my-command-cheat.git ~/dotfiles/cheat
  fi

  if [[ ! -d ~/dotfiles/nvim ]] ; then
    echo 'To download my nvim configuration'
    git clone --depth 1 git@github.com:adoyle-h/neovim-config.git ~/dotfiles/nvim
  fi

  if has not command fzf ; then
    echo 'To install fzf'
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
  fi

  if has not command cheat ; then
    echo 'To install cheat'
    pip install cheat
  fi

  if has not command grip ; then
    echo 'To install grip'
    pip install grip
  fi

  ./install

  echo 'To setup bash-custom plugins'
  a enable-plugin $(cat ./bootstrap_custom_plugins)

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
