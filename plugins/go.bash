cite about-plugin
about-plugin 'Golang settings'

# Set the GOPROXY environment variable
export GOPROXY=https://goproxy.io

go_use_local() {
  gvm pkgset use --local
}
