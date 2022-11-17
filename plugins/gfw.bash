about-plugin 'Settings for GFW'

export ELECTRON_MIRROR=http://npm.taobao.org/mirrors/electron/

# # https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/
# export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
# export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
# export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

export BASH_IT_HTTP_PROXY='socks5://127.0.0.1:1080' # shadowsocks port
export BASH_IT_HTTPS_PROXY=$BASH_IT_HTTP_PROXY
export BASH_IT_NO_PROXY='127.0.0.1,localhost'
