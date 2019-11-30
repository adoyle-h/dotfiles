if [[ ${BASH_VERSINFO[0]} -lt 4 ]] \
  || ([[ ${BASH_VERSINFO[0]} == 4 ]] && [[ ${BASH_VERSINFO[1]} -lt 4 ]]); then
  cat >&2 <<EOF
${YELLOW_ESC}
Current Bash version ($BASH_VERSION) is not supported. Now use default shell settings.
Please upgrade Bash to 4.4 or higher version. Then restart shell to continue.

For mac user, \`brew install bash\` to install latest version.
${RESET_ALL_ESC}
EOF
  return 3
fi

if [[ $("$DOTFILES_DIR/bin/sub/bash-info") != "$BASH_VERSION" ]]; then
  cat >&2 <<EOF
${YELLOW_ESC}
Please check PATH environment variable. The bash is different from your login shell.
You can invoke "$DOTFILES_DIR/bin/sub/bash-info" and "\`which bash\` --version" to check version.
Now use default shell settings. Please fix your PATH, then restart shell to continue.
${RESET_ALL_ESC}
EOF
  return 4
fi
