cite about-plugin
about-plugin 'python settings.'

_init_python_paths() {
  local python2_bin python3_bin

  if dotfiles_l.has command python3; then
    python3_bin=$(python3 -c 'import site; print(site.USER_BASE)')/bin
    if [[ -d $python3_bin ]]; then
      export PATH="$PATH:$python3_bin"
    fi
  fi

  if dotfiles_l.has command python2; then
    python2_bin=$(python2 -c 'import site; print(site.USER_BASE)')/bin
    if [[ -d $python2_bin ]]; then
      export PATH="$PATH:$python2_bin"
    fi
  fi

  if dotfiles_l.has command pipx; then
    export PIPX_BIN_DIR="$XDG_CONFIG_HOME/pipx/bin"
    export PIPX_HOME="$PIPX_BIN_DIR/pipx/pipx"

    export PATH="$PATH:$PIPX_BIN_DIR"
    eval "$(register-python-argcomplete pipx)"
  fi
}

_init_python_paths

unset _init_python_paths
