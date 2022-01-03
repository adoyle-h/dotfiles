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

_df_load() {
  DOTFILES_DEBUG "To load $DOTFILES_DIR/$1"
  local before=$(date +%s)

  # shellcheck disable=SC1090
  source "$DOTFILES_DIR/$1"

  local now=$(date +%s)
  local elapsed=$(( now - before ))

  if (( elapsed > 0 )); then
    DOTFILES_DEBUG "$(printf "%bLoaded %s in %ss%b" '\e[33m' "$DOTFILES_DIR/$1" $elapsed '\e[0m')"
  else
    DOTFILES_DEBUG "Loaded $DOTFILES_DIR/$1 in ${elapsed}s"
  fi
}

# shellcheck source=./xdg.bash
_df_load "bash/xdg.bash"

# shellcheck source=failover.bash
_df_load "bash/failover.bash"

# shellcheck source=../deps/colors.bash
_df_load "deps/colors.bash"

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

# shellcheck source=bash_it.lib.bash
_df_load "bash/bash_it.lib.bash"

# shellcheck source=../deps/dotfiles_l.bash
_df_load "deps/dotfiles_l.bash"

# shellcheck source=./helper.bash
_df_load "bash/helper.bash"

# shellcheck source=./os-settings.bash
_df_load "bash/os-settings.bash"

# shellcheck source=./enable-plugs.bash
_df_load "bash/enable-plugs.bash"

# shellcheck source=./sub.bash
_df_load "bash/sub.bash"

DOTFILES_DEBUG "DOTFILES LOADED"
DOTFILES_LOADED=loaded
