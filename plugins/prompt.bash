cite about-plugin
about-plugin 'My pretty bash prompt instead of bash-it theme.'

PROMPT_ENABLE_HISTORY_APPEND=1
PROMPT_PYTHON_VIRTUALENV_LEFT=
PROMPT_STYLE_CWD=block          # bubble or block
PROMPT_STYLE_TIME=bubble        # bubble or block
PROMPT_STYLE_EXIT_STATUS=bubble # bubble or block
PROMPT_STYLE_JOB=bubble         # bubble or block
PROMPT_COLOR_TIME=GREEN

# shellcheck source=../deps/a-bash-prompt/a.prompt.bash
source "$DOTFILES_DIR/deps/a-bash-prompt/a.prompt.bash"
