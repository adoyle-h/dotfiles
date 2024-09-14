# ONE_LOAD_PRIORITY: 380
about-plugin 'Some settings for MacOS'

if [[ "$(uname -s)" != "Darwin" ]]; then
	echo "Current system is not MacOS." >&2
	return 1
fi

# Set aliases -----------------------------------------------------------------

alias finder='open -a Finder '

# Flush your dns cache
alias flush-dns='dscacheutil -flushcache'

# Use Finder's Quick Look on a file (^C or space to close)
alias quicklook='qlmanage -p 2>/dev/null'

# Mute/Unmute the system volume. Plays nice with all other volume settings.
alias mute="osascript -e 'set volume output muted true'"
alias unmute="osascript -e 'set volume output muted false'"

# -----------------------------------------------------------------------------
