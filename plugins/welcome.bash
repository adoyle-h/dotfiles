# BASH_IT_LOAD_PRIORITY: 999
cite about-plugin
about-plugin 'print welcome message on first login shell'

cat <<EOF
${BLUE_ESC}
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
                         Welcome! ${USER^^}
                             　/\\/\\
                             =(°w°)=
                             　)❣(⎛
                              (___)
                         Enjoy Your Life!

$(w | awk '{print "  " $0}')
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
${RESET_ALL_ESC}
EOF
