# BASH_IT_LOAD_PRIORITY: 999
cite about-plugin
about-plugin 'print welcome message on first login shell'

cat <<EOF
${BLUE_ESC}
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
                             　/\\/\\
                             =(°w°)=
                             　)❣(⎛
                              (___)
                         Welcome! ${USER^^}
                     Enjoy Coding, Enjoy Life!

$(w | awk '{print "  " $0}')
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
${RESET_ALL_ESC}
EOF
