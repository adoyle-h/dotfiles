# Fix PATH problems caused by /usr/libexec/path_helper in MacOS.
# Refer to https://scriptingosx.com/2017/05/where-paths-come-from/'
# Secondly, Homebrew install Bash at $HOMEBREW_PREFIX/bin/bash, and MacOS default bash 3 at /bin/bash,
path_list=(
  # /usr/local/bin must before /bin in PATH
  /usr/local/bin
  /usr/local/sbin

  # /opt/homebrew for MacOS ARM arch
  /opt/homebrew/bin
  /opt/homebrew/sbin

  /usr/bin
  /bin
  /usr/sbin
  /sbin

  "$HOME/bin"
)

export PATH=''

for path in "${path_list[@]}"; do
  if [[ -d $path ]]; then
    PATH=${PATH}:$path
  fi
done

PATH="${PATH:1}"

unset -v path_list path
