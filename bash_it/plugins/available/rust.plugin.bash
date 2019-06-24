cite about-plugin
about-plugin 'Rust pre-settings'

CARGO_BIN=$HOME/.cargo/bin
if [[ -d $CARGO_BIN ]] ; then
  export PATH="$PATH:$CARGO_BIN"
else
  echo "Not found folder $CARGO_BIN" >&2
  return 1
fi

# Enable auto completion
if dotfiles_l.has command rustup; then
  eval "$(rustup completions bash)"
fi
