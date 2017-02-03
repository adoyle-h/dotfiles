#!/usr/bin/env bash
# shellcheck disable=SC1090

BASH_IT=${BASH_IT:-${HOME}/.bash_it}
BASH_IT_CUSTOM=${BASH_IT_CUSTOM:-${BASH_IT}/custom}

OS=$(uname -s)
if [[ "${OS}" = "SunOS" ]] ; then
  SYSTEM='Solaris'
elif [[ "${OS}" = "Darwin" ]] ; then
  SYSTEM='Macos'
elif [[ "${OS}" = "Linux" ]] ; then
  if [[ -f /etc/debian_version ]] ; then
    SYSTEM='Debian'
  elif [[ -f /etc/redhat-release ]] ; then
    SYSTEM='RedHat'
  fi
else
  SYSTEM=""
fi

if [[ -z ${SYSTEM} ]]; then return; fi

for config_file in ${BASH_IT_CUSTOM}/${SYSTEM}/*.bash
do
  if [[ -f "${config_file}" ]]; then
    [[ "$_DEBUG" == "on" ]] && echo "Now executing ${config_file}"
    source "$config_file"
  fi
done

unset -v OS SYSTEM
