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

# The completion files load order if file existed:
# - /etc/bash_completion
# - /etc/profile.d/bash_completion.sh
# - /usr/share/bash-completion/bash_completion
# - if bash_completion installed. It will load files in order:
#   - ${BASH_COMPLETION_COMPAT_DIR:-/usr/local/etc/bash_completion.d}
#   - ${BASH_COMPLETION_USER_FILE:-~/.bash_completion}
# - $HOME/.bash_completions

# bash_completion.sh will use $BASH_COMPLETION_COMPAT_DIR and $BASH_COMPLETION_USER_FILE
BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"

BASH_COMPLETION_DIRS=(
  # Loads the system's Bash completion modules.
  /etc/bash_completion
  # Some distribution makes use of a profile.d script to import completion.
  /etc/profile.d/bash_completion.sh
  /usr/share/bash-completion/bash_completion
)

for BASH_COMPLETION_FILE in "${BASH_COMPLETION_DIRS[@]}"; do
  if [[ -f  BASH_COMPLETION_FILE ]]; then
    DOTFILES_DEBUG "To load completion file: $BASH_COMPLETION_FILE"
    source "$BASH_COMPLETION_FILE"
  fi
done

load_user_completion() {
  DOTFILES_DEBUG "Loading $HOME/.bash_completion"

  local completion_files file
  # Load user completion files
  if [[ -d $HOME/.bash_completions ]]; then
    completion_files="$HOME/.bash_completions/*.sh $HOME/.bash_completions/*.bash"
    for file in $completion_files; do
      DOTFILES_DEBUG "To load completion file $file"
      source "$file"
    done
  fi
}

if [[ $(uname) = "Darwin" ]] && dotfiles_l.has command brew; then
  # To enable bash_completion in macos
  BASH_COMPLETION_FILE=/usr/local/etc/profile.d/bash_completion.sh
  if [[ -r "$BASH_COMPLETION_FILE" ]]; then
    DOTFILES_DEBUG "To load bash-completion: $BASH_COMPLETION_FILE"
    source "$BASH_COMPLETION_FILE"
  fi

  load_user_completion
else
  load_user_completion
fi

unset -v BASH_COMPLETION_FILE BASH_COMPLETION_DIRS BASH_COMPLETION_COMPAT_DIR
unset load_user_completion
