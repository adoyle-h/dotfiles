# BASH_IT_LOAD_PRIORITY: 200
cite about-plugin
about-plugin 'Make more sensible for shell'

#------------------------ shell optional behavior ----------------------------#

#--------------------------------  shopt -------------------------------------#

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# aliases are expanded as described above under ALIASES.
# This option is enabled by default for interactive shells.
shopt -s expand_aliases

# shell error messages are written in the standard GNU error message format.
# shopt -s gnu_errfmt

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
# shopt -s globstar

#-------------------------------- set -o -------------------------------------#

# Exit immediately if a simple command (see SHELL  GRAMMAR
# above) exits with a non-zero status.  The shell does not
# exit if the command that fails is part  of  the  command
# list  immediately  following  a  while or until keyword,
# part of the test in an if statement, part of a && or  ||
#   list, or if the command's return value is being inverted
# via !.  A trap on ERR, if set, is  executed  before  the
# shell exits.
# DO NOT ENABLE IT IN YOUR INTERACTIVE SHELL! ONLY ENABLE IT FOR SCRIPT
# set -o errexit

# Treat unset variables as an error when performing param-
# eter expansion.  If expansion is attempted on  an  unset
# variable, the shell prints an error message, and, if not
# interactive, exits with a non-zero status.
# DO NOT ENABLE IT IN YOUR INTERACTIVE SHELL! ONLY ENABLE IT FOR SCRIPT
# set -o nounset

# If set, the return value of a  pipeline  is  the
# value  of  the  last (rightmost) command to exit
# with a non-zero status, or zero if all  commands
# in  the pipeline exit successfully.  This option
# is disabled by default.
set -o pipefail

# Do not exit shell when Ctrl-D pressed
# Refer to http://www.theunixschool.com/2012/09/ignoreeof-prevent-terminal-close-user-logout.html
set -o ignoreeof
IGNOREEOF=5

# After expanding each simple command, for  command,  case
# command, select command, or arithmetic for command, dis-
# play the expanded value of PS4, followed by the  command
# and its expanded arguments or associated word list.
# ONLY ENABLE IT FOR DEBUG
# set -o xtrace

#-------------------------------- set +o -------------------------------------#


#---------------------------- Shell Variables --------------------------------#

# Specifies how often (in seconds)  bash  checks  for  mail.   The
# default  is  60 seconds.  When it is time to check for mail, the
# shell does so before displaying the  primary  prompt.   If  this
# variable  is  unset,  or  set  to  a  value that is not a number
# greater than or equal to zero, the shell disables mail checking.
unset -v MAILCHECK


#--------------------- Shell Environment Configuration -----------------------#
