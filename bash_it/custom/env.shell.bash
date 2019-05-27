#--------------------- Shell Environment Configuration -----------------------#

if [[ "$0" == '-bash' ]]; then
  # Disable `alt-numkey` in bash shell. Refer to http://superuser.com/a/770902
  # Do NOT use explicit escaping: "\\e"
  for i in "-" "n" "p" "" {0..9}; do bind -r "\e$i"; done

  # https://www.gnu.org/software/grep/manual/html_node/Environment-Variables.html
  export GREP_COLOR='01;31'
fi
