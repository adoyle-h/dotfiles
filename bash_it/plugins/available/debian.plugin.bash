cite about-plugin
about-plugin 'Some settings for Debian system'

if [[ "$(uname -s)" != "Linux" ]] or [[ ! -f /etc/debian_version ]]; then
  echo "WARNING: Current system is not Debian but you have enable debian.plugin.bash."
  return
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [[ -z "$debian_chroot" ]] && [[ -r /etc/debian_chroot ]]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

alias open='nautilus'
