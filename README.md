# dotfiles

My configurations and shell scripts.

**Currently, it is only a personal workplace rather than a framework. So you should FORK the REPO first before using it.**

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
- [Bash initialization process](#bash-initialization-process)
- [Bash-it Enables/Disables](#bash-it-enablesdisables)
- [Customize your Bash](#customize-your-bash)
    - [Binary executables](#binary-executables)
        - [Sub-commands](#sub-commands)
    - [Secret Data](#secret-data)
- [Version](#version)
- [Suggestion, Bug Reporting, Contributing](#suggestion-bug-reporting-contributing)
- [Copyright and License](#copyright-and-license)

<!-- /MarkdownTOC -->

## Environments

- iTerm2 Build 3.0.14 (Terminal.app compatible)
- GNU bash 4.4.12(1)-release (x86_64-apple-darwin15.6.0) (GNU bash v3 compatible)
- Tmux 2.3 (Not necessary. Tmux compatible)

## Dependencies

- [git][]: **It is required**. Make sure it available before installation.
- [gnu-sed][]: Macos default sed is poor, use gnu-sed instead. **It is required**. Make sure it available before installation.
- [dotbot][]: To create symbolic links and manage the map via [`install.conf.yaml`][install.conf.yaml]. There is no need to install dotbot manually. It is a part of this repo.
- [bash-it (modified version)][a-bash-it]: To manage all shell scripts in modules: aliases, plugins, completions and shell appearance theme. **It is required**. Make sure it available before installation.
- [bash-completion][] (for bash 3.x) or [bash-completion2][bash-completion] (for bash 4.x). If omitted, git prompt may show nothing.

## Features

- Manage collections of dotfiles via [dotbot][]. See [the configuration][install.conf.yaml].
- Manage shell scripts/completions/aliases/plugins by modules via [bash-it][].
  - Most features are implemented in separate plugins, which could be disabled by yourself.
  - All my plugins are put in [`bash-custom/`](./bash-custom/) folder. And some enabled plugins provided by bash-it. Refer to [Bash-it Enables/Disables](#bash-it-enablesdisables).
  - Compatible with [bash-completion][] (for bash 3.x) and [bash-completion2][bash-completion] (for bash 4.x). See the [configuration](https://github.com/adoyle-h/dotfiles/blob/master/bash_it/completions.bash)
- Auto-execute specific scripts for different system (ubuntu/macos and so on).
- Responsive and pretty PS1, and personalized theme `𝕬`. Refer to [Preview](#preview).
- Collections of shell commands, which locates in [`bin/`](./bin/) directory. Refer to [Binary executables](#binary-executables).
- Manage sub commands, which locates in [`bin/sub/`](./bin/sub/) directory. The manage framework is modified from [sub][].
  - Default `SUB_NAME=a`，press `a help` to see help. You can modify the enterpoint (SUB_NAME) in Plugin: [sub.plugin.bash][]
  - Refer to [Sub-commands](#sub-commands) for more.
- My best practices for shell (bash).
- My best practices for [todo.cli](https://github.com/ginatrapani/todo.txt-cli).
- My best practices for [neovim][]. See [the configuration](https://github.com/adoyle-h/neovim-config).
- My best practices for [tmux][]. See [the configuration](https://github.com/adoyle-h/dotfiles/blob/master/configs/tmux.conf).
- My best practices for git. See [the configuration](https://github.com/adoyle-h/dotfiles/blob/master/configs/gitconfig).
- My cheat sheets based on [chrisallenlane/cheat](https://github.com/chrisallenlane/cheat).
- Maintain your classified data in `secrets/` folder, which is ignored by git. Refer to [Secret Data](#secret-data).
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
# Clone this repo
DOTFILE_DIR=~/dotfiles
git clone --depth 1 --recursive https://github.com/adoyle-h/dotfiles.git $DOTFILE_DIR
# Install gnu-sed, if you are using Macos
brew install gnu-sed --with-default-names
# Install bash_it framework which is required
git clone --depth 1 https://github.com/adoyle-h/bash-it ~/.bash_it
~/.bash_it/install.sh --no-modify-config
${DOTFILE_DIR}/bash_it/reset.sh
# Put your classified data in `secrets/` folder
mkdir -p ${DOTFILE_DIR}/secrets
# cheat is optional
git clone --depth 1 https://github.com/adoyle-h/my-command-cheat.git ${DOTFILE_DIR}/cheat
# neovim-config is optional
git clone --depth 1 --recursive https://github.com/adoyle-h/neovim-config.git ${DOTFILE_DIR}/nvim
# spencertipping/cd is optional
mkdir -p ~/.cd && git clone --depth 1 https://github.com/spencertipping/cd.git ~/.cd/core
# check `install.conf.yaml` file
# make soft-links for dotfiles
./install
# checkout the output
```

## Configuration

### UI

`$TERM` should be `xterm-256color` or `screen-256color` for best appearance.

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
    └── secrets.env.bash
```

## Bash initialization process

It will generally execute these scripts in order:

1. bash/bashrc
2. bash_it/enable
3. bash_it framework
    1. bash_it/{lib,aliases,completions,plugins}
4. bash-custom/*.bash
    1. system-detect.shell.bash
        - Macos/*.bash
        - Debian/*.bash
5. bash-custom/enabled/*.bash

## Bash-it Enables/Disables

The aliases/plugins/completions I enabled could be referred in [`bash_it/reset.sh`](./bash_it/reset.sh).

## Customize your Bash

All your own plugins should be put in [`bash-custom/`](./bash-custom/).

Sometimes, you could modify the files in `bash_it/` for prior execution.

You should leave the [`bash/`](./bash/) folder alone. DO NOT CHANGE ANYTHING IN IT.

### Binary executables

All your own binary executables should be put in [`bin`](./bin/) folder.

#### Sub-commands

These executables could also be put in [`bin/sub/`]('./bin/sub/') which is included in `$PATH`,
and it could be referred as sub-command. Example:

- `a help`
- `a comments`
- `a 256color`

All sub-commands are auto-completed. Type `a <Tab>` to see all sub-commands.

### Secret Data

Type `ll bash-custom/secrets.env.bash`, and you will see that:

`bash-custom/secrets.env.bash@ -> ../secrets/secrets.env.bash`

So, you could maintain your classified data in `secrets/secrets.env.bash`.

The `secrets/` folder is ignored by git. You could put anything in this folder.

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
[a-bash-it]: https://github.com/adoyle-h/bash-it
[sub]: https://github.com/basecamp/sub
[neovim]: https://github.com/neovim/neovim
[tmux]: https://github.com/tmux/tmux
[fzf]: https://github.com/junegunn/fzf
[sub.plugin.bash]: https://github.com/adoyle-h/dotfiles/blob/master/bash-custom/sub.plugin.bash
[font]: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DejaVuSansMono
[color scheme]: https://github.com/mbadolato/iTerm2-Color-Schemes#deep
[color scheme - installation]: https://github.com/mbadolato/iTerm2-Color-Schemes#installation-instructions
[gnu-sed]: https://www.gnu.org/software/sed/
[git]: https://github.com/git/git
[bash-completion]: https://github.com/scop/bash-completion
