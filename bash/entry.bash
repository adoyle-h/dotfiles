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

# --------------------- Load Basic Variables and Functions --------------------

# shellcheck source=./path.bash
. "$DOTFILES_DIR/bash/path.bash"

# shellcheck source=../deps/colors.bash
. "$DOTFILES_DIR/deps/colors.bash"

# shellcheck source=../runtime/bash_config.bash
. "$DOTFILES_DIR/runtime/bash_config.bash"

# shellcheck source=debug.bash
. "$DOTFILES_DIR/bash/debug.bash"

_df_load() {
  local key before now

  # Skip loading if skip_comps defined in runtime/bash_config.bash
  for key in "${DOTFILES_SKIP_COMPS[@]}"; do
    if [[ bash/$key.bash == "$1" ]]; then
      dotfiles_debug "$YELLOW%s$RESET_ALL" "(Skip) To load $DOTFILES_DIR/$1"
      return
    fi
  done

  dotfiles_debug "To load $DOTFILES_DIR/$1"
  before=$(date +%s)

  # shellcheck disable=SC1090
  . "$DOTFILES_DIR/$1"

  now=$(date +%s)
  local elapsed=$(( now - before ))

  if (( elapsed > 0 )); then
    dotfiles_debug "%bLoaded %s in %ss%b" "$YELLOW" "$DOTFILES_DIR/$1" $elapsed "$RESET_ALL"
  else
    dotfiles_debug "Loaded $DOTFILES_DIR/$1 in ${elapsed}s"
  fi
}

# shellcheck source=./xdg.bash
_df_load "bash/xdg.bash"

# shellcheck source=failover.bash
_df_load "bash/failover.bash"


dotfiles_debug "To load check-environment.bash"
# shellcheck source=check-environment.bash
if ! . "$DOTFILES_DIR/bash/check-environment.bash"; then
  dotfiles_failover
  return
fi

if [[ -f $HOME/.bashrc.override ]]; then
  dotfiles_debug "To load .bashrc.override"
  # See "$DOTFILES_SUB bashrc" for usage
  # shellcheck disable=SC1090
  . "$(cat "$HOME"/.bashrc.override)"
  return
fi

# ---------------------- Load Optional Functions Below ------------------------

# shellcheck source=bash_it.lib.bash
_df_load "bash/bash_it.lib.bash"

# shellcheck source=../deps/dotfiles_l.bash
_df_load "deps/dotfiles_l.bash"

# shellcheck source=./helper.bash
_df_load "bash/helper.bash"

# shellcheck source=./os-settings.bash
_df_load "bash/os-settings.bash"

# Fig: https://github.com/withfig/fig
[[ $DOTFILES_FIG == on ]] && eval "$(fig init bash pre)"

# shellcheck source=./enable-plugs.bash
_df_load "bash/enable-plugs.bash"

# shellcheck source=./sub.bash
_df_load "bash/sub.bash"

[[ $DOTFILES_FIG == on ]] && eval "$(fig init bash post)"

dotfiles_debug "${GREEN}%s${RESET_ALL}" "[DOTFILES LOADED DONE]"
DOTFILES_LOADED=loaded
