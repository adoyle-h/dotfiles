# dotfiles

My configurations and shell scripts.

## TOC

<!-- MarkdownTOC GFM -->

- [Dependencies](#dependencies)
- [File Structure](#file-structure)
    - [Main](#main)
- [Bootstrap](#bootstrap)
- [Install](#install)
- [Enables](#enables)

<!-- /MarkdownTOC -->

## Dependencies

1. [dotbot][]: To create symbolic links and manage the map via [`install.conf.yaml`](./install.conf.yaml).
2. [bash-it][]: To manage all shell scripts in modules: aliases, plugins, completions and shell theme.

## File Structure

```
.
├── README.md
├── bash/
│   ├── bash_profile
│   ├── bashrc
│   ├── inputrc
│   └── profile
├── bash-custom/                 # your bash scripts
│   ├── Debian/                  # bash scripts for Linux Debian
│   ├── Macos/                   # bash scripts for Macos
│   ├── aliases.shell.bash       # same to bash_it aliases
│   ├── cheat.plugin.bash
│   ├── completions.shell.bash   # same to bash_it completions
│   ├── editor.env.bash
│   ├── env.shell.bash
│   ├── functions.shell.bash     # same to bash_it lib
│   ├── fzf.plugin.bash
│   ├── gvm.plugin.bash
│   ├── lesspipe.plugin.bash
│   ├── optionals.shell.bash
│   ├── path.env.bash
│   ├── proxy.env.bash
│   ├── secrets.env.bash -> ../secrets/secrets.env.bash
│   ├── system-detect.shell.bash # detect system and run its bash scripts
│   ├── themes/                  # the bash_it theme
│   ├── tmux.plugin.bash
│   ├── variables.shell.bash
│   └── zzz_last_cd.plugin.bash  # Ensure the plugin should be loaded at last
├── bash_it/                     # https://github.com/Bash-it/bash-it#your-custom-scripts-aliases-themes-and-functions
│   ├── aliases.bash
│   ├── completions.bash
│   ├── enable.bash              # enable bash_it
│   ├── lib.bash
│   └── plugins.bash
├── bin/                         # link to ~/bin
├── bootstrap -> ./bootstrap.bash*
├── bootstrap.bash*
├── cheat/                       # https://github.com/chrisallenlane/cheat
├── completions/                 # bash completions
│   └── pm2-completion.sh*
├── configs/                     # application configuration
├── dotbot/                      # https://github.com/anishathalye/dotbot
├── install*
├── install.conf.yaml            # dotbot configuration
├── nvim/                        # neovim configuration
├── secrets/                     # Put your sensitive data here
│   ├── iterm/
│   ├── keybase-installer/
│   └── secrets.env.bash
└── ssh/                         # link to ~/.ssh
    ├── authorized_keys          # ignored
    ├── config
    ├── deploy/
    ├── dev/
    ├── id_rsa                   # ignored
    ├── id_rsa.pub               # ignored
    └── known_hosts              # ignored
```

### Main

## Bootstrap

Run `./bootstrap` to initialize in a new environment.

**Do not call the script under sudo.**

## Install

Run `./install` to create symbolic links.

**Do not call the script under sudo.**

## Enables

The aliases/plugins/completions I enabled:

[aliases]

- osx

[plugins]

- alias-completion
- autojump
- base
- battery
- browser
- docker-compose
- docker-machine
- docker
- explain
- extract
- fzf
- gif
- java
- nginx
- nvm
- osx-timemachine
- osx
- projects
- proxy
- rvm
- ssh
- xterm

[completions]

- bash-it
- brew
- bundler
- capistrano
- defaults
- docker-compose
- docker-machine
- docker
- gem
- go
- grunt
- makefile
- npm
- nvm
- pip
- projects
- rake
- ssh
- system
- terraform
- tmux
- todo
- virtualbox

<!-- links -->

[dotbot]: https://github.com/anishathalye/dotbot/
[bash-it]: https://github.com/Bash-it/bash-it
