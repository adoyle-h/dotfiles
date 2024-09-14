about-plugin 'Usage: with-proxy <command>. The command will use http proxy.'
about-plugin 'You should set environment variable MY_PROXY by self.'

with-proxy() {
  local MY_PROXY=${MY_PROXY:-127.0.0.1:7890}
  local http_proxy="http://$MY_PROXY"
  local https_proxy="http://$MY_PROXY"
  local socket_proxy="socks5://$MY_PROXY"

  # shellcheck disable=2097
  http_proxy="$http_proxy" \
    HTTP_PROXY="$http_proxy" \
    https_proxy="$https_proxy" \
    HTTPS_PROXY="$https_proxy" \
    ALL_PROXY="$socket_proxy" \
    "$@"
}
