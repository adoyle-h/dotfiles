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

# The completion files load order:
# - bash_completion will load files in order:
#   - ${BASH_COMPLETION_COMPAT_DIR:-/usr/local/etc/bash_completion.d}
#   - ${BASH_COMPLETION_USER_FILE:-~/.bash_completion}
# - this plugin will load
#   - $HOME/.bash_completions

if [[ -x "$(command -v brew)" ]] ; then
  # If Homebrew is installed, its Bash completion modules are loaded.
  BREW_PREFIX=$(brew --prefix)

  if [[ -n "$BREW_PREFIX" ]]; then
    # To enable bash_completion in macos
    if [[ -f "$BREW_PREFIX"/share/bash-completion/bash_completion ]] && [[ "${BASH_VERSINFO[0]}" =~ [45] ]]; then
      # bash-completion2
      BASH_COMPLETION_FILE="$BREW_PREFIX"/share/bash-completion/bash_completion
    elif [[ -f "$BREW_PREFIX"/etc/bash_completion ]]; then
      # bash-completion
      BASH_COMPLETION_FILE="$BREW_PREFIX"/etc/bash_completion
    fi
  fi
  unset -v BREW_PREFIX
fi

if [[ -z "$BASH_COMPLETION_FILE" ]]; then
  # Loads the system's Bash completion modules.
  if [[ -f /etc/bash_completion ]]; then
    BASH_COMPLETION_FILE=/etc/bash_completion
  elif [[ -f /etc/profile.d/bash_completion.sh ]]; then
    # Some distribution makes use of a profile.d script to import completion.
    BASH_COMPLETION_FILE=/etc/profile.d/bash_completion.sh
  else
    # check bash_completion in other system
    BASH_COMPLETION_FILE="/usr/share/bash-completion/bash_completion"
  fi
fi

# Load BASH_COMPLETION_FILE
DOTFILES_DEBUG BASH_COMPLETION_FILE=$BASH_COMPLETION_FILE
if [[ -f "$BASH_COMPLETION_FILE" ]]; then
  source "$BASH_COMPLETION_FILE"
fi

# Load user completion files
if [[ -d $HOME/.bash_completions ]]; then
  completion_files="$HOME/.bash_completions/*.sh $HOME/.bash_completions/*.bash"
  for file in $completion_files; do
    source "$file"
  done
fi

unset -v BASH_COMPLETION_FILE
