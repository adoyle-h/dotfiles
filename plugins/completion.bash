# BASH_IT_LOAD_PRIORITY: 202
# shellcheck disable=SC1090

cite about-plugin
about-plugin 'Make more sensible for shell completions'


# If set to ‘on’, menu completion displays the common prefix of the list of
# possible completions (which may be empty) before cycling through the list. The default is ‘off’.
bind "set menu-complete-display-prefix on"

# Make Tab autocomplete regardless of filename case
bind "set completion-ignore-case on"

# List all matches in case multiple possible completions are possible
bind "set show-all-if-ambiguous on"

# Show all autocomplete results in page
bind "set page-completions on"

# If there are more than 40 possible completions for a word, ask to show them all
bind "set completion-query-items 40"

# Do not autocomplete hidden files unless the pattern explicitly begins with a dot
bind "set match-hidden-files off"

# Immediately add a trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"

# Displays possible completions using different colors to indicate their file type with
# readline v6.3 and later. The color definitions are taken from the value of the LS_COLORS
# environment variable.
bind "set colored-stats on"

# Be more intelligent when autocompleting by also looking at the text after
# the cursor. For example, when the current line is "cd ~/src/mozil", and
# the cursor is on the "z", pressing Tab will not autocomplete it to "cd
# ~/src/mozillail", but to "cd ~/src/mozilla". (This is supported by the
# Readline used by Bash 4.)
bind "set skip-completed-text on"


# Show extra file information when completing, like `ls -F` does
# bind "set visible-stats on"

###############################################################################

# The completion files loaded if file existed:
# - /etc/bash_completion
# - /etc/profile.d/bash_completion.sh
# - /usr/share/bash-completion/bash_completion
# - If bash-completion installed. It will load files in order when file existed:
#   - ${XDG_CONFIG_HOME:-$HOME/.config}/bash_completion
#   - ${BASH_COMPLETION_COMPAT_DIR:-/usr/local/etc/bash_completion.d} (It is an option for backwards compatibility. https://github.com/scop/bash-completion/blob/2.11/doc/bash_completion.txt#L22)
#   - ${BASH_COMPLETION_USER_FILE:-~/.bash_completion}

BASH_COMPLETION_DIRS=(
  # Loads the system's Bash completion modules.
  /etc/bash_completion
  # Some distribution makes use of a profile.d script to import completion.
  /etc/profile.d/bash_completion.sh
  /usr/share/bash-completion/bash_completion
  # bash-completion
  /usr/local/etc/profile.d/bash_completion.sh
  # bash-completion (MacOS Apple Silicon)
  /opt/homebrew/etc/profile.d/bash_completion.sh
)

for BASH_COMPLETION_FILE in "${BASH_COMPLETION_DIRS[@]}"; do
  if [[ -f $BASH_COMPLETION_FILE ]]; then
    DOTFILES_DEBUG "To load completion file: $BASH_COMPLETION_FILE"
    source "$BASH_COMPLETION_FILE"
  fi
done

unset -v BASH_COMPLETION_FILE BASH_COMPLETION_DIRS
