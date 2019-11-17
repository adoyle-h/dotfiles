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

MAIN_MANPATHS="/usr/local/share/man:/usr/share/man"
export MANPATH="$MAIN_MANPATHS"
unset -v MAIN_MANPATHS

# Add bash 4 manpage path
BASH_4_MANPATH="/usr/local/opt/bash/share/man"
if [[ -d "$BASH_4_MANPATH" ]] \
  && ( ! dotfiles_l.str_include "$MANPATH" "$BASH_4_MANPATH" ); then
  export MANPATH="$BASH_4_MANPATH:$MANPATH"
fi
unset -v BASH_4_MANPATH

if dotfiles_l.has command gdate; then
  # GNU File, Shell, and Text utilities for mac. Depend on "brew install coreutils"
  alias date='gdate'
  alias timeout='gtimeout'
  alias truncate='gtruncate'
else
  echo "WARNING: Not found gdate. You should install coreutils before enable gnu.plugin.bash. Try brew install coreutils." >&2
fi

gnu_sed_bin=/usr/local/opt/gnu-sed/libexec/gnubin
if [[ -d $gnu_sed_bin ]] && ( ! dotfiles_l.str_include "$PATH" "$gnu_sed_bin" ); then
  export PATH="$gnu_sed_bin:$PATH"
  export MANPATH="$BASH_4_MANPATH:$MANPATH:/usr/local/opt/gnu-sed/libexec/gnuman"
fi
unset -v gnu_sed_bin
