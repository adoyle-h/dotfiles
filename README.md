# dotfiles

My configurations and shell scripts.

## TOC

<!-- MarkdownTOC GFM -->

- [Environments](#environments)
- [Dependencies](#dependencies)
- [Features](#features)
- [Preview](#preview)
- [Installation](#installation)
- [Configuration](#configuration)
    - [UI](#ui)
    - [Dotfiles](#dotfiles)
- [Usage](#usage)
    - [Bootstrap](#bootstrap)
    - [Install](#install)
- [File Structure](#file-structure)
- [Script Order](#script-order)
- [Bash-it Enables](#bash-it-enables)
- [Version](#version)
- [Suggestion, Bug Reporting, Contributing](#suggestion-bug-reporting-contributing)
- [Copyright and License](#copyright-and-license)

<!-- /MarkdownTOC -->

## Environments

- iTerm2 Build 3.0.14 (Terminal.app also work)
- GNU bash 4.4.12(1)-release (x86_64-apple-darwin15.6.0) (It also works on GNU bash v3)
- tmux 2.3 (Not necessary, It also works under Tmux)

## Dependencies

- [dotbot][]: To create symbolic links and manage the map via [`install.conf.yaml`][install.conf.yaml].
- [bash-it][]: To manage all shell scripts in modules: aliases, plugins, completions and shell theme. But this repo uses [my modified version](https://github.com/adoyle-h/bash-it)

## Features

- Manage collections of dotfiles via [dotbot][]. See [the configuration][install.conf.yaml].
- Manage shell scripts/completions/aliases/plugins by modules via [bash-it][].
  - Most features are implemented in separate plugins, which could be disabled by yourself.
  - All my plugins are put in [`bash-custom/`](./bash-custom/) folder. And some enabled plugins provided by bash-it. Refer to [Enables](#enables).
  - Compatible with [bash-completion (For bash 3.x) and bash-completion2 (For bash 4.x)](https://github.com/scop/bash-completion). See the [configuration](https://github.com/adoyle-h/dotfiles/blob/master/bash_it/completions.bash)
- Auto-execute specific scripts for different system (ubuntu/macos and so on).
- Responsive and pretty PS1, and personalized theme `𝕬`.
- Collections of shell commands, which locates in [`bin/`](./bin/) directory.
- Manage sub commands, which locates in [`bin/sub/`](./bin/sub/) directory. The manage framework is modified from [sub][].
  - Default `SUB_NAME=a`，press `a help` to see help. You can modify the enterpoint (SUB_NAME) in Plugin: [sub.plugin.bash][]
- My best practices for shell (bash).
- My best practices for [todo.cli](https://github.com/ginatrapani/todo.txt-cli).
- My best practices for [neovim][]. See [the configuration](https://github.com/adoyle-h/neovim-config).
- My best practices for [tmux][]. See [the configuration](https://github.com/adoyle-h/dotfiles/blob/master/configs/tmux.conf).
- My best practices for git. See [the configuration](https://github.com/adoyle-h/dotfiles/blob/master/configs/gitconfig).
- My cheat sheets based on [chrisallenlane/cheat](https://github.com/chrisallenlane/cheat).
- Maintain your classified data in `secrets/` folder, which is ignored by git.
- Integrated with [spencertipping/cd](https://github.com/spencertipping/cd).
- Integrated with [fzf][]. See [the configuration](https://github.com/adoyle-h/dotfiles/blob/master/bash-custom/fzf.plugin.bash).

## Preview

![preview.png](./docs/img/preview.png?raw=true)

Responsive UI (Adjust with window width). No need to restart Terminal. Only press Enter:

![responsive-ui.png](./docs/img/responsive-ui.png?raw=true)

Highlight Backgound jobs:

![background-jobs.png](./docs/img/background-jobs.png?raw=true)

Use sub commands:

![sub-commands.jpeg](./docs/img/sub-commands.jpeg?raw=true)

## Installation

```sh
git clone --depth 1 --recursive https://github.com/adoyle-h/dotfiles.git ~/dotfiles
# Put your classified data in `secrets/` folder
mkdir -p ~/dotfiles/secrets
# cheat is optional
git clone --depth 1 https://github.com/adoyle-h/my-command-cheat.git ~/dotfiles/cheat
# neovim is optional
git clone --depth 1 --recursive git@github.com:adoyle-h/neovim-config.git ~/dotfiles/nvim
# check `install.conf.yaml` file
# make soft-links
./install
# checkout the output
```

## Configuration

### UI

- Font: [DejaVuSansMonoForPowerline Nerd Font Book][font]
- Color Scheme: [Deep][color scheme]. [Installation Instructions][color scheme - installation]

### Dotfiles

Edit the [`install.conf.yaml`][install.conf.yaml] file.

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
│   ├── bash_profile                # Link to ~/.bash_profile
│   ├── bashrc                      # Link to ~/.bashrc
│   ├── inputrc                     # Link to ~/.inputrc
│   └── profile                     # Link to ~/.profile
├── bash-custom/                    # your bash scripts
│   ├── Debian/                     # bash scripts for Linux Debian
│   │   └── core.bash
│   ├── aliases.shell.bash          # same to bash_it aliases
│   ├── available/                  # Custom available bash scripts
│   │   └── zzz_last_cd.plugin.bash # Ensure the plugin should be loaded at last
│   ├── bash.plugin.bash
│   ├── cheat.plugin.bash
│   ├── completions.shell.bash      # same to bash_it completions
│   ├── editor.env.bash
│   ├── enabled/                    # Custom enabled bash scripts
│   │   └── zzz_last_cd.plugin.bash -> ../available/zzz_last_cd.plugin.bash
│   ├── env.shell.bash
│   ├── functions.shell.bash        # same to bash_it lib
│   ├── fzf.plugin.bash
│   ├── gvm.plugin.bash
│   ├── lesspipe.plugin.bash
│   ├── Macos/                      # bash scripts for Macos
│   │   └── core.bash
│   ├── optionals.shell.bash
│   ├── path.env.bash               # change environment variable PATH
│   ├── proxy.env.bash
│   ├── secrets.env.bash -> ../secrets/secrets.env.bash
│   ├── system-detect.shell.bash    # detect system and run its bash scripts
│   ├── themes/                     # the bash_it theme
│   │   └── 𝕬/
│   │       └── 𝕬.theme.bash
│   ├── tmux.plugin.bash
│   ├── variables.shell.bash
│   └── xcode.plugin.bash
├── bash_it/                        # https://github.com/Bash-it/bash-it#your-custom-scripts-aliases-themes-and-functions
│   ├── aliases.bash
│   ├── completions.bash
│   ├── enable.bash                 # bash_it configuration and entrance
│   ├── lib.bash                    # Reset $PATH and $MANPATH, and set common functions
│   └── plugins.bash
├── bin/                            # link to ~/bin
│   ├── sub/                        # Collections of sub commands
│   └── a -> ./sub-bin              # Enterpoint of sub commands
├── bootstrap -> ./bootstrap.bash*
├── bootstrap.bash*
├── cheat/                          # It is ignored in git. git clone https://github.com/adoyle-h/my-command-cheat cheat
├── completions/                    # bash completions
├── configs/                        # application configuration
├── dotbot/                         # https://github.com/anishathalye/dotbot
├── install*
├── install.conf.yaml               # dotbot configuration
├── nvim/                           # neovim configuration. It is ignored in git. git clone https://github.com/adoyle-h/neovim-config nvim
└── secrets/                        # Put your sensitive data here. It is ignored in git. mkdir secrets
    ├── iterm/
    ├── keybase-installer/
    └── secrets.env.bash
```

## Script Order

1. bash/bashrc
2. bash_it/enable
3. bash_it framework
    1. bash_it/{lib,aliases,completions,plugins}
4. bash-custom/*.bash
    1. system-detect.shell.bash
        - Macos/*.bash
        - Debian/*.bash
5. bash-custom/enabled/*.bash

## Bash-it Enables

The aliases/plugins/completions I enabled:

[aliases]

`bash-it disable alias all`

[plugins]

`bash-it enable plugin alias-completion autojump base battery browser docker-compose docker-machine docker explain extract gif java nginx node nvm osx-timemachine osx proxy rvm ssh xterm`

[completions]

`bash-it enable completion bash-it brew bundler capistrano defaults docker-compose docker-machine docker gem go grunt makefile npm nvm pip projects rake ssh terraform tmux todo virtualbox`

## Version

No version yet

## Suggestion, Bug Reporting, Contributing

Sorry, the project is a personal project which do not accept any Pull Requests.
You could fork the repo to build your own project.

Any comments and suggestions are always welcome. Please open an [issue][] to contact with me.

## Copyright and License

Copyright (c) 2017 ADoyle. The project is licensed under the **BSD 3-clause License**.

See the [LICENSE][] file for the specific language governing permissions and limitations under the License.

See the [NOTICE][] file distributed with this work for additional information regarding copyright ownership.


<!-- links -->

[issue]: https://github.com/adoyle-h/dotfiles/issues
[LICENSE]: ./LICENSE
[NOTICE]: ./NOTICE

<!-- links -->

[install.conf.yaml]: ./install.conf.yaml
[dotbot]: https://github.com/anishathalye/dotbot/
[bash-it]: https://github.com/Bash-it/bash-it
[sub]: https://github.com/basecamp/sub
[neovim]: https://github.com/neovim/neovim
[tmux]: https://github.com/tmux/tmux
[fzf]: https://github.com/junegunn/fzf
[sub.plugin.bash]: https://github.com/adoyle-h/dotfiles/blob/master/bash-custom/sub.plugin.bash
[font]: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DejaVuSansMono
[color scheme]: https://github.com/mbadolato/iTerm2-Color-Schemes#deep
[color scheme - installation]: https://github.com/mbadolato/iTerm2-Color-Schemes#installation-instructions
