cite about-plugin
about-plugin 'To load asdf if installed. https://github.com/asdf-vm/asdf'

# shellcheck disable=SC1091

if [[ -f "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh" ]]; then
  source "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh"
elif [[ -f "$HOME/.asdf/asdf.sh" ]]; then
  source "$HOME/.asdf/asdf.sh"
  source "$HOME/.asdf/completions/asdf.bash"
fi
