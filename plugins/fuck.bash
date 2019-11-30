cite about-plugin
about-plugin 'The-fuck, corrects your previous console command.'

plug_check \
  thefuck \
  'install thefuck by https://github.com/nvbn/thefuck#installation' \
  || return

eval "$(thefuck --alias)"
