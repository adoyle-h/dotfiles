# BASH_IT_LOAD_PRIORITY: 180
cite about-plugin
about-plugin 'Some settings for MacOS'

if [[ "$(uname -s)" != "Darwin" ]] ; then
  echo "WARNING: Current system is not MacOS but you have enabled macos.plugin.bash." >&2
  return 0
fi

alias finder='open -a Finder '

# Flush your dns cache
alias flush-dns='dscacheutil -flushcache'

# Use Finder's Quick Look on a file (^C or space to close)
alias quicklook='qlmanage -p 2>/dev/null'

# Mute/Unmute the system volume. Plays nice with all other volume settings.
alias mute="osascript -e 'set volume output muted true'"
alias unmute="osascript -e 'set volume output muted false'"


# Fix PATH and MANPATH problems caused by /usr/libexec/path_helper in MacOS.
# Refer to https://scriptingosx.com/2017/05/where-paths-come-from/'

MAIN_PATHS="$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$MAIN_PATHS"

MAIN_MANPATHS="/usr/local/share/man:/usr/share/man"
export MANPATH="$MAIN_MANPATHS"
unset -v MAIN_MANPATHS MAIN_PATHS


# Add bash 4 manpage path
BASH_4_MANPATH="/usr/local/opt/bash/share/man"
if [[ "${BASH_VERSINFO[0]}" =~ [45] ]] && [[ -d "$BASH_4_MANPATH" ]]; then
  if __no_matched_path "$BASH_4_MANPATH" "$MANPATH"; then
    export MANPATH="$BASH_4_MANPATH:$MANPATH"
  fi
fi
unset -v BASH_4_MANPATH
