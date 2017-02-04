XCODE_MANPATHS="/Applications/Xcode.app/Contents/Developer/usr/share/man:/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/share/man"

export MANPATH="$MANPATH:$XCODE_MANPATHS"
unset -v XCODE_MANPATHS
