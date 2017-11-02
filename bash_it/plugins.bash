# shellcheck disable=SC1090

bash-it-enables() {
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
