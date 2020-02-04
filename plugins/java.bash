cite about-plugin
about-plugin 'Java settings'

if [[ "$(uname -s)" == "Darwin" ]] ; then
  # https://mkyong.com/java/how-to-set-java_home-environment-variable-on-mac-os-x/
  export JAVA_HOME=$(/usr/libexec/java_home)
else
  # @TODO for Windows and Linux system
  true
fi
