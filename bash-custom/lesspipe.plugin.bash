# Depend on source-highlight. To install: brew install source-highlight
# READ: http://liyangliang.me/posts/2013/11/less-with-syntax-highlight-and-line-number/
# make less more friendly for non-text input files, see lesspipe(1)
if [[ -x /usr/bin/lesspipe ]]; then
  LESSPIPE_SCRIPT=/usr/bin/lesspipe
  eval "$(SHELL=/bin/sh lesspipe)"
elif [[ -x /usr/local/bin/src-hilite-lesspipe.sh ]]; then
  LESSPIPE_SCRIPT=/usr/local/bin/src-hilite-lesspipe.sh
fi

if [[ -n "$LESSPIPE_SCRIPT" ]]; then
  export LESSOPEN="| ${LESSPIPE_SCRIPT} %s"
  export LESS=" -R "
fi
