check_support() {
  local os=$(l.detect_os)
  if [[ $os != 'MacOS' ]] && [[ $os != 'Linux' ]]; then
    echo 'The system is not supported now.' >&2
    return 3;
  else
    echo "Current system: $os"
  fi

  if [[ $(l.is_bash) == false ]]; then
    echo 'Current shell is not bash' >&2
    return 4;
  else
    echo "Current Bash version: $BASH_VERSION"
  fi
}

