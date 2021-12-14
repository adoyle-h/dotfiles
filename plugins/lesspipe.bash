cite about-plugin
about-plugin 'Enable highlight for less command.'
about-plugin 'Depend on source-highlight.  https://www.gnu.org/software/src-highlite'
about-plugin 'To install:'
about-plugin '  for MacOS: brew install source-highlight'
about-plugin '  for other systems: https://www.gnu.org/software/src-highlite/source-highlight.html#Installation'

# make less more friendly for non-text input files, see lesspipe(1)
if [[ -x /usr/bin/lesspipe ]]; then
  LESSPIPE_SCRIPT=/usr/bin/lesspipe
else
  LESSPIPE_SCRIPT=$(which src-hilite-lesspipe.sh)
fi

if [[ -n "$LESSPIPE_SCRIPT" ]]; then
  export LESSOPEN="| ${LESSPIPE_SCRIPT} %s"
  export LESS=" -R "
else
  echo 'WARNING: LESSPIPE_SCRIPT not found. But you have enabled lesspipe.plugin.bash.' >&2
fi
