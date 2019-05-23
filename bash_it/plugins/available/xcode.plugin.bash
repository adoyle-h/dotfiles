cite about-plugin
about-plugin 'xcode settings'

XCODE_MANPATHS="/Applications/Xcode.app/Contents/Developer/usr/share/man:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/share/man"

if __no_matched_path "$XCODE_MANPATHS;" "$MANPATH"; then
  export MANPATH="$MANPATH:$XCODE_MANPATHS"
fi
unset -v XCODE_MANPATHS
