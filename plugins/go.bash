cite about-plugin
about-plugin 'Golang settings'

MY_GOPATH=~/Workspace/go

if [[ ! -e $MY_GOPATH ]]; then
  mkdir -p "$MY_GOPATH"
fi

if [[ -n $GOPATH ]]; then
  export GOPATH=$MY_GOPATH:$GOPATH
else
  export GOPATH=$MY_GOPATH
fi

# GVM has set global GOPATH in PATH. See plugins/gvm.bash. MY_GOPATH must before global GOPATH.
PATH=$MY_GOPATH/bin:$PATH

# export GOPROXY=https://goproxy.io,direct
export GOPROXY=https://goproxy.cn,direct

# 设置不走 proxy 的私有仓库，多个用逗号相隔
# export GOPRIVATE=*.corp.example.com

go_use_local() {
  gvm pkgset use --local
}

[[ -f $MY_GOPATH/bin/gocomplete ]] && complete -C $MY_GOPATH/bin/gocomplete go

unset -v MY_GOPATH
