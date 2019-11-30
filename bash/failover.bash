# You can invoke "a fast-bashrc open" to set .fast_bashrc. And "a fast-bashrc close" to unset.
export DOTFILES_BASHRC_FAILOVER=${DOTFILES_BASHRC_FAILOVER:-"$DOTFILES_DIR/bash/bashrc.failover.bash"}

dotfiles_failover() {
  if [[ -r "$DOTFILES_BASHRC_FAILOVER" ]]; then
    DOTFILES_DEBUG "To load DOTFILES_BASHRC_FAILOVER: ${DOTFILES_BASHRC_FAILOVER}"
    # shellcheck source=./bashrc.failover
    source "$DOTFILES_BASHRC_FAILOVER"
  fi
  return 0
}
