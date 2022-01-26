# Required variables which OS related for plugins should put in this file.

DOTFILES_OS=$(dotfiles_l.detect_os)

case $DOTFILES_OS in
  MacOS)
    # shellcheck source=./macos.bash
    source "$DOTFILES_DIR/bash/macos.bash"
    ;;
  Linux)
    source "$DOTFILES_DIR/bash/linux.bash"
    ;;
  *)
    ;;
esac

