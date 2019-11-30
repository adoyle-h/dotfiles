cite about-plugin
about-plugin 'xcode settings'

add_xcode_manpath() {
  local XCODE_MANPATH=$1

  if ! dotfiles_l.str_include "$MANPATH" "$XCODE_MANPATH"; then
    export MANPATH="$MANPATH:$XCODE_MANPATH"
  fi
}

add_xcode_manpath "/Applications/Xcode.app/Contents/Developer/usr/share/man"
add_xcode_manpath "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/share/man"
unset -f add_xcode_manpath
