# Path to the bash it configuration
export BASH_IT="$HOME/.bash_it"
export BASH_IT_CUSTOM="$BASH_IT/custom/adoyle"

# Lock and Load a custom theme file
export BASH_IT_THEME='𝕬'

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=false

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

bash-it-enables () {
  echo "[aliases]"
  echo ""
  for i in $BASH_IT/aliases/enabled/*.bash; do echo $i | awk -F"/" '{print $NF}' | sed 's/.aliases.bash//'; done
  echo ""
  echo "[plugins]"
  echo ""
  for i in $BASH_IT/plugins/enabled/*.bash; do echo $i | awk -F"/" '{print $NF}' | sed 's/.plugin.bash//'; done
  echo ""
  echo "[completions]"
  echo ""
  for i in $BASH_IT/completion/enabled/*.bash; do echo $i | awk -F"/" '{print $NF}' | sed 's/.completion.bash//'; done
}

# Load Bash It
source "$BASH_IT/bash_it.sh"
