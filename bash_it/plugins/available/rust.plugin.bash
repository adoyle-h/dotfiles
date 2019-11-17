cite about-plugin
about-plugin 'Rust completion and settings'

CARGO_BIN=$HOME/.cargo/bin
if [[ -d $CARGO_BIN ]] ; then
  export PATH="$PATH:$CARGO_BIN"
  unset -v CARGO_BIN
else
  cat >&2 <<EOF
You have enabled rust plugin. But plugin not found folder: $CARGO_BIN.
Invoke "a plugins-disable rust" to disable this plugin.
EOF
  unset -v CARGO_BIN
  return 1
fi

# Enable auto completion
if dotfiles_l.has command rustup; then
  eval "$(rustup completions bash)"
fi
