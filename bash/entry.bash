# If not running interactively, don't do anything
[[ -z "${PS1:-}" ]] && return

if [[ -z ${DOTFILES_DIR:-} ]]; then
  echo "variable 'DOTFILES_DIR' is not defined." >&2
  return
fi

# Only execute this file once if loading or loaded
if [[ "${DOTFILES_LOADED:-}" == loading ]] || [[ "${DOTFILES_LOADED:-}" == loaded ]]; then
  return
else
  DOTFILES_LOADED=loading
fi

# shellcheck source=./path.bash
source "$DOTFILES_DIR/bash/path.bash"

# shellcheck source=debug.bash
. "$DOTFILES_DIR/bash/debug.bash"

DOTFILES_DEBUG "To load $DOTFILES_DIR/bash/xdg.bash"
# shellcheck source=./xdg.bash
source "$DOTFILES_DIR/bash/xdg.bash"

DOTFILES_DEBUG "To load failover.bash"
# shellcheck source=failover.bash
. "$DOTFILES_DIR/bash/failover.bash"

DOTFILES_DEBUG "To load deps/colors.bash"
# shellcheck source=../deps/colors.bash
source "$DOTFILES_DIR/deps/colors.bash"

# ----------------------- All Basic Variables Put Above -----------------------

DOTFILES_DEBUG "To load check-environment.bash"
# shellcheck source=check-environment.bash
if ! . "$DOTFILES_DIR/bash/check-environment.bash"; then
  dotfiles_failover
  return
fi

if [[ -f $HOME/.bashrc.override ]]; then
  DOTFILES_DEBUG "To load .bashrc.override"
  # See "$DOTFILES_SUB bashrc" for usage
  # shellcheck disable=SC1090
  . "$(cat "$HOME"/.bashrc.override)"
  return
fi

# -------------------------- All Functions Put Below --------------------------

DOTFILES_DEBUG "To load sub.bash"
# shellcheck source=./sub.bash
source "$DOTFILES_DIR/bash/sub.bash"

DOTFILES_DEBUG "To load bash_it.lib.bash"
# shellcheck source=bash_it.lib.bash
source "$DOTFILES_DIR/bash/bash_it.lib.bash"

DOTFILES_DEBUG "To load deps/dotfiles_l.bash"
# shellcheck source=../deps/dotfiles_l.bash
source "$DOTFILES_DIR/deps/dotfiles_l.bash"

DOTFILES_DEBUG "To load bash/helper.bash"
# shellcheck source=../bash/helper.bash
source "$DOTFILES_DIR/bash/helper.bash"

DOTFILES_DEBUG "To load enable-plugs.bash"
# shellcheck source=./enable-plugs.bash
source "$DOTFILES_DIR/bash/enable-plugs.bash"

DOTFILES_DEBUG "DOTFILES LOADED"
DOTFILES_LOADED=loaded
