# Required variables which OS related for plugins should put in this file.

# This script installs Homebrew to its preferred prefix. (HOMEBREW_PREFIX, HOMEBREW_REPOSITORY, HOMEBREW_CELLAR)
# /usr/local for macOS Intel, /opt/homebrew for Apple Silicon and /home/linuxbrew/.linuxbrew for Linux
# See https://docs.brew.sh/Installation
if [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
elif [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Fix MANPATH --------------------------------------------------------

# Fix PATH and MANPATH problems caused by /usr/libexec/path_helper in MacOS.
# Refer to https://scriptingosx.com/2017/05/where-paths-come-from/'

search_manpaths=(
  /opt/homebrew/opt/bash/share/man
  /opt/homebrew/share/man/
  /usr/local/opt/bash/share/man
  /usr/local/share/man
  /usr/share/man
)

export MANPATH=''

for path in "${search_manpaths[@]}"; do
  if [[ -d $path ]]; then
    MANPATH=${MANPATH}:$path
  fi
done

MANPATH="${MANPATH:1}"

unset -v search_manpaths path
