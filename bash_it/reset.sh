#!/usr/bin/env sh
set -o errexit

bash-it disable alias all
bash-it disable plugin all
bash-it disable completion all

## [aliases]
bash-it enable alias osx 
## [plugins]
bash-it enable plugin alias-completion autojump base battery browser docker-compose docker-machine docker explain extract gif java nginx node nvm osx-timemachine proxy rvm ssh 
## [completions]
bash-it enable completion bash-it brew bundler capistrano defaults docker-compose docker-machine docker gem go grunt makefile npm nvm pip projects rake ssh terraform tmux todo virtualbox 
