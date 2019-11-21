# BASH_IT_LOAD_PRIORITY: 180
cite about-plugin
about-plugin 'Use gnu-sed instead of default sed for MacOS'

gnu_sed_bin=/usr/local/opt/gnu-sed/libexec/gnubin
if [[ -d $gnu_sed_bin ]] && ( ! dotfiles_l.str_include "$PATH" "$gnu_sed_bin" ); then
  export PATH="$gnu_sed_bin:$PATH"
  export MANPATH="$BASH_4_MANPATH:$MANPATH:/usr/local/opt/gnu-sed/libexec/gnuman"
fi
unset -v gnu_sed_bin
