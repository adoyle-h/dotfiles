# BASH_IT_LOAD_PRIORITY: 900
cite about-plugin
about-plugin 'GPG settings'

# https://wiki.archlinux.org/index.php/GnuPG#Configure_pinentry_to_use_the_correct_TTY
# pinentry need GPG_TTY to launch. Otherwise GPG sign will fail.
export GPG_TTY
# @TODO Why it always return 'not a tty'?
GPG_TTY=$(tty)
