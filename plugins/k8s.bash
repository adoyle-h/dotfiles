cite about-plugin
about-plugin 'k8s settings'

alias kc=kubectl
complete -F __start_kubectl kc

# https://kubernetes.io/docs/reference/kubectl/cheatsheet/#kubectl-context-and-configuration
export KUBECONFIG=~/.kube/config:~/.kube/work-dev.config:~/.kube/work-test.config

##########################
#  Kubebuilder settings  #
##########################

dotfiles_l.str_replace() {
  echo "${1/$2/$3}"
}

kubebuilder_use() {
  local KUBEBUILDER_VER=$1
  local KUBEBUILDER_PATH=$HOME/bin/kubebuilder_$KUBEBUILDER_VER

  local OLD_KUBEBUILDER_VER
  OLD_KUBEBUILDER_VER=$(kubebuilder_version)

  if [[ -d $KUBEBUILDER_PATH ]]; then
    if [[ -n $OLD_KUBEBUILDER_VER ]]; then
      PATH=$(dotfiles_l.str_replace "$PATH" "$HOME/bin/kubebuilder_$OLD_KUBEBUILDER_VER" "$KUBEBUILDER_PATH")
    else
      PATH=$PATH:$KUBEBUILDER_PATH/bin
    fi
  fi

  echo "Using kubebuilder:$KUBEBUILDER_VER"
}

kubebuilder_switch() {
  local KUBEBUILDER_VER
  KUBEBUILDER_VER=$(kubebuilder_version)

  if [[ $KUBEBUILDER_VER == 1.0.8 ]]; then
    KUBEBUILDER_VER=2
  else
    KUBEBUILDER_VER=1.0.8
  fi
  kubebuilder_use $KUBEBUILDER_VER
}

kubebuilder_version() {
  dotfiles_l.match "$PATH" 'bin/kubebuilder_([._0-9]+)/bin'
}

kubebuilder_status() {
  local KUBEBUILDER_VER
  KUBEBUILDER_VER=$(kubebuilder_version)
  echo "Kubebuilder Version: $KUBEBUILDER_VER"
}


if dotfiles_l.has command kustomize; then
  complete -C kustomize kustomize
fi

kubebuilder_use 2 > /dev/null
