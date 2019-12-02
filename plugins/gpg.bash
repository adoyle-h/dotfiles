cite about-plugin
about-plugin 'GPG settings'

# https://wiki.archlinux.org/index.php/GnuPG#Configure_pinentry_to_use_the_correct_TTY
# pinentry need GPG_TTY to launch. If GPG_TTY is not a tty, GPG sign will fail.
export GPG_TTY
GPG_TTY=$(tty)
