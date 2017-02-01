#!/usr/bin/env bash
# shellcheck disable=SC1090

# set variable identifying the chroot you work in (used in the prompt below)
if [[ -z "$debian_chroot" ]] && [[ -r /etc/debian_chroot ]]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

alias open='nautilus'
