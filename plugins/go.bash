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

# https://github.com/posener/complete/tree/master
if [[ -f $MY_GOPATH/bin/gocomplete ]]; then
  complete -C $MY_GOPATH/bin/gocomplete go
else
  cat <<EOF
[plugins/go.bash]
Not found gocomplete.
Try to install gocomplete by "go get -u github.com/posener/complete/v2/gocomplete"
Then restart shell.
EOF
fi

unset -v MY_GOPATH
