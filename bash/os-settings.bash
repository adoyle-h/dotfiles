# Required variables which OS related for plugins should put in this file.

case $(dotfiles_l.detect_os) in
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

