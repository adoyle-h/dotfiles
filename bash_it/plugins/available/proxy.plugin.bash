cite about-plugin
about-plugin 'Set proxy mirror environment variables'

export ELECTRON_MIRROR=http://npm.taobao.org/mirrors/electron/

## homebrew 镜像 https://lug.ustc.edu.cn/wiki/mirrors/help/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

# export BASH_IT_HTTP_PROXY='http://127.0.0.1:28124' # polipo port
export BASH_IT_HTTP_PROXY='socks5://127.0.0.1:1080' # shadowsocks port
export BASH_IT_HTTPS_PROXY=$BASH_IT_HTTP_PROXY
export BASH_IT_NO_PROXY='127.0.0.1,localhost'
