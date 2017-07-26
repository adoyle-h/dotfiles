GETTEXT_BIN_DIR=/usr/local/opt/gettext/bin
if [[ -d $GETTEXT_BIN_DIR ]]; then
  export PATH="$PATH:$GETTEXT_BIN_DIR"
fi
