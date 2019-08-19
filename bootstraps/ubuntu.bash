bootstrap() {
  echo 'To bootstrap for Ubuntu'

  ln -snf "/usr/share/zoneinfo/$TZ" /etc/localtime
  echo "$TZ" > /etc/timezone

  DEBIAN_FRONTEND=noninteractive apt-get -y install dnsutils

  apt-get -y install \
    build-essential bash-completion iputils-ping netcat dnsutils curl wget \
    ssh git neovim fzf tmux grip

  apt-get -y clean
  apt-get -y autoclean
}
