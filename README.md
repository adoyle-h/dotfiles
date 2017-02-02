# dotfiles

My configurations and shell scripts.

## TOC

<!-- MarkdownTOC GFM -->

- [Dependencies](#dependencies)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
    - [Bootstrap](#bootstrap)
    - [Install](#install)
- [File Structure](#file-structure)
- [Enables](#enables)
- [Version](#version)
- [Suggestion, Bug Reporting, Contributing](#suggestion-bug-reporting-contributing)
- [Copyright and License](#copyright-and-license)

<!-- /MarkdownTOC -->

## Dependencies

1. [dotbot][]: To create symbolic links and manage the map via [`install.conf.yaml`](./install.conf.yaml).
2. [bash-it][]: To manage all shell scripts in modules: aliases, plugins, completions and shell theme.

## Features

## Installation

```sh
git clone --depth 1 --recursive https://github.com/adoyle-h/dotfiles.git ~/dotfiles
mkdir -p ~/dotfiles/secrets
# git clone --depth 1 https://github.com/adoyle-h/my-command-cheat.git ~/dotfiles/cheat
```

## Usage

### Bootstrap

**IT IS UNDER DEVELOPMENT. DO NOT USE!**

Run `./bootstrap` to initialize in a new environment.

**Do not call the script under sudo.**

### Install

Run `./install` to create symbolic links.

**Do not call the script under sudo.**

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
│   ├── path.env.bash            # change environment variable PATH
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
│   ├── enable.bash              # bash_it configuration and entrance
│   ├── lib.bash
│   └── plugins.bash
├── bin/                         # link to ~/bin
├── bootstrap -> ./bootstrap.bash*
├── bootstrap.bash*
├── cheat/                       # https://github.com/chrisallenlane/cheat
├── completions/                 # bash completions
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


## Version

No version yet

## Suggestion, Bug Reporting, Contributing

Sorry, the project is a personal project which do not accept any Pull Requests.
You could fork the repo to build your own project.

Any comments and suggestions are always welcome. Please open an [issue][] to contact with me.

## Copyright and License

Copyright (c) 2017 ADoyle. The project is licensed under the **BSD 3-clause License**.

See the [LICENSE][] file for the specific language governing permissions and limitations under the License.


<!-- links -->

[issue]: https://github.com/adoyle-h/dotfiles/issues
[LICENSE]: ./LICENSE

<!-- links -->

[dotbot]: https://github.com/anishathalye/dotbot/
[bash-it]: https://github.com/Bash-it/bash-it
