# The XDG_ variables definitions:
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html#variables

## User directories
[[ -z $XDG_CONFIG_HOME ]] && export XDG_CONFIG_HOME="$HOME/.config"
[[ -z $XDG_CACHE_HOME ]] && export XDG_CACHE_HOME="$HOME/.cache"
[[ -z $XDG_DATA_HOME ]] && export XDG_DATA_HOME="$HOME/.local/share"
if [[ -z $XDG_RUNTIME_DIR ]]; then
  XDG_RUNTIME_DIR="$TMPDIR/xdg-$USER"
  export XDG_RUNTIME_DIR
  [[ ! -d $XDG_RUNTIME_DIR ]] && mkdir -p "$XDG_RUNTIME_DIR"
fi

## User custom directories
[[ -z $XDG_DESKTOP_DIR ]] && export XDG_DESKTOP_DIR="$HOME/Desktop"
[[ -z $XDG_DOCUMENTS_DIR ]] && export XDG_DOCUMENTS_DIR="$HOME/Documents"
[[ -z $XDG_DOWNLOAD_DIR ]] && export XDG_DOWNLOAD_DIR="$HOME/Downloads"
[[ -z $XDG_MUSIC_DIR ]] && export XDG_MUSIC_DIR="$HOME/Music"
[[ -z $XDG_PICTURES_DIR ]] && export XDG_PICTURES_DIR="$HOME/Pictures"
[[ -z $XDG_PUBLICSHARE_DIR ]] && export XDG_PUBLICSHARE_DIR="$HOME/Public"
[[ -z $XDG_TEMPLATES_DIR ]] && export XDG_TEMPLATES_DIR="$HOME/tmp"
[[ -z $XDG_VIDEOS_DIR ]] && export XDG_VIDEOS_DIR="$HOME/Videos"

## System directories
# a set of preference ordered base directories relative to which data files should be searched
[[ -z $XDG_DATA_DIRS ]] && export XDG_DATA_DIRS="/usr/local/share:/usr/share"
# a set of preference ordered base directories relative to which configuration files should be searched
[[ -z $XDG_CONFIG_DIRS ]] && export XDG_CONFIG_DIRS="/etc/xdg"
