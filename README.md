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
    - [Modifications by yourself](#modifications-by-yourself)
    - [UI](#ui)
    - [Dotfiles](#dotfiles)
- [Usage](#usage)
    - [Bootstrap](#bootstrap)
    - [Install](#install)
- [File Structure](#file-structure)
- [Bash initialization process](#bash-initialization-process)
- [Bash-it Enables/Disables](#bash-it-enablesdisables)
- [Use ~/.fast_bashrc for rescue](#use-fast_bashrc-for-rescue)
- [Use ~/.bashrc.debug for debug](#use-bashrcdebug-for-debug)
- [Customize your Bash](#customize-your-bash)
    - [Binary executables](#binary-executables)
    - [Sub-commands](#sub-commands)
        - [sub-command document](#sub-command-document)
        - [sub-command completion](#sub-command-completion)
    - [Secret Data](#secret-data)
- [Bash Completions](#bash-completions)
- [Version](#version)
- [Suggestion, Bug Reporting, Contributing](#suggestion-bug-reporting-contributing)
- [Copyright and License](#copyright-and-license)

<!-- /MarkdownTOC -->

## Environments

- iTerm2 Build 3.0.14 (Terminal.app compatible)
- GNU bash 4.4.12(1)-release (x86_64-apple-darwin15.6.0) (GNU bash v3 compatible)
- Tmux 2.7 (Not necessary. Tmux compatible)

## Dependencies

- [git][]: **It is required**. Make sure it available before installation.
  - [git-prompt][]: If omitted, PS1 will not show git prompt.
- [dotbot][]: To create symbolic links and manage the map via [`install.conf.yaml`][install.conf.yaml]. There is no need to install dotbot manually. It is a part of this repo.
- [bash-it (modified version)][a-bash-it]: To manage all shell scripts in modules: aliases, plugins, completions and shell appearance theme. **It is required**. Make sure it available before installation.

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
- My best practices for [neovim][]. See [the configuration](https://github.com/adoyle-h/neovim-config).
- My best practices for [tmux][]. See [the configuration](https://github.com/adoyle-h/dotfiles/blob/master/configs/tmux.conf).
- My best practices for git. See [the configuration](https://github.com/adoyle-h/dotfiles/blob/master/configs/gitconfig).
- My cheat sheets based on [chrisallenlane/cheat](https://github.com/chrisallenlane/cheat).
- Maintain your classified data in `secrets/` folder, which is ignored by git. Refer to [Secret Data](#secret-data).
- Many third integrations
  - [z.lua](https://github.com/skywind3000/z.lua).
  - [fzf][]. See [the configuration](https://github.com/adoyle-h/dotfiles/blob/master/bash-custom/fzf.plugin.bash).
  - [taskbook](https://github.com/klaussinani/taskbook).

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
cd $DOTFILE_DIR
# Clone submodules and initialize them
git submodule update --init

# Install bash_it framework which is required
git clone --depth 1 https://github.com/adoyle-h/bash-it -b a/1.0.0-stable ~/.bash_it
~/.bash_it/install.sh --no-modify-config
${DOTFILE_DIR}/bash_it/reset

# Create `secrets/` folder. Put your classified data in this folder
mkdir -p ${DOTFILE_DIR}/secrets

## neovim-config is optional
# cd ${DOTFILE_DIR}/nvim
# Read README and install dependencies

# Check `install.conf.yaml` file
# Make soft-links for dotfiles
./install
# Checkout the output
```

The `install` script will generated a file `$HOME/.dotfilerc`. **Do not modify or remove it.**

And then read the [Configuration - Modifications by yourself](#modifications-by-yourself) section.

## Configuration

### Modifications by yourself

These parts of below files you should modify:

./configs/gitconfig:

```
[user]
    name = <your-username>
    email = <your-email>
```

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
│   ├── bash_4.plugin.bash
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
│   ├── optionals.shell.bash        # Shell Optional Behavior settings
│   ├── path.env.bash               # change environment variable PATH
│   ├── proxy.env.bash              # application proxy settings
│   ├── secrets.env.bash -> ../secrets/secrets.env.bash
│   ├── system-detect.shell.bash    # detect system and run its bash scripts
│   ├── themes/                     # the bash_it theme
│   │   └── 𝕬/
│   │       └── 𝕬.theme.bash
│   ├── tmux.plugin.bash
│   ├── variables.shell.bash        # Shell Variables settings
│   └── xcode.plugin.bash
├── bash_it/                        # https://github.com/Bash-it/bash-it#your-custom-scripts-aliases-themes-and-functions
│   ├── aliases.bash
│   ├── completions.bash
│   ├── enable.bash                 # bash_it configuration and entrance
│   ├── lib.bash                    # Reset $PATH and $MANPATH, and set common functions
│   ├── plugins.bash
│   └── reset*                      # custom reset bash-it aliases/plugins/completions
├── bin/                            # link to ~/bin
│   ├── sub/                        # Collections of sub commands
│   ├── sub-bin*                    # Sub main file
│   └── a -> ./sub-bin              # Enterpoint of sub commands
├── bootstrap -> ./bootstrap.bash*
├── bootstrap.bash*
├── cheat/                          # It is ignored in git. git clone https://github.com/adoyle-h/my-command-cheat cheat
├── completions/                    # bash command completions. Link to ~/.bash_completions
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
    - bash_it/aliases.bash
    - bash_it/plugins.bash
    - bash_it/completions.bash
    - [custom] bash_it/aliases.bash
    - [custom] bash_it/plugins.bash
    - [custom] bash_it/completions.bash
    - bash-custom/theme/**/*.bash
4. bash-custom/*.bash
    1. system-detect.shell.bash
        - Macos/*.bash
        - Debian/*.bash
5. bash-custom/enabled/*.bash

## Bash-it Enables/Disables

The aliases/plugins/completions I enabled could be referred in [`bash_it/reset`](./bash_it/reset).

`bash-it-enables` to show all aliases/plugins/completions you enabled.

`bash-it-enables -e` to save all aliases/plugins/completions you enabled.

## Use ~/.fast_bashrc for rescue

If `.bashrc` has any critical issue, you could create a `$HOME/.fast_bashrc` file to replace `$HOME/.bashrc`.

## Use ~/.bashrc.debug for debug

`touch ~/.bashrc.debug` to print debug logs.

And remove the file to disable debug.

## Customize your Bash

All your own plugins should be put in [`bash-custom/`](./bash-custom/).

Sometimes, you could modify the files in `bash_it/` for prior execution.

You should leave the [`bash/`](./bash/) folder alone. DO NOT CHANGE ANYTHING IN IT.

### Binary executables

All your own binary executables should be put in [`bin`](./bin/) folder.

### Sub-commands

These executables could also be put in [`bin/sub/`]('./bin/sub/') which is included in `$PATH`,
and it could be referred as sub-command. Example:

- `a help`
- `a comments`
- `a 256color`

All sub-commands are auto-completed. Type `a <Tab>` to see all sub-commands.

#### sub-command document

Your could write Usage/Summary/Help for sub-command.
Put below text to your `bin/sub/<sub-command>`,

```sh
# Usage: a who
# Summary: Check who's logged in
# Help: This will print out when you run `a help who`.
```

Enter `a` to get all usages.
And `a help <sub-command>` for getting "Summary" and "Help" of the sub-command.

Refer to [Self-documenting subcommands](https://github.com/basecamp/sub#self-documenting-subcommands) for more details.

#### sub-command completion

Sub-command completion **must be** implemented with below text in your `bin/sub/<sub-command>` file.

```sh
# Provide sub completions
if [ "$1" = "--complete" ]; then
  ls
fi
```

Refer to https://github.com/basecamp/sub#autocompletion .

### Secret Data

Type `ll bash-custom/secrets.env.bash`, and you will see that:

`bash-custom/secrets.env.bash@ -> ../secrets/secrets.env.bash`

So, you could maintain your classified data in `secrets/secrets.env.bash`.

The `secrets/` folder is ignored by git. You could put anything in this folder.

## Bash Completions

Put your completion files under `completions/`.

Attention: this directory does not work for your sub-command completion.

## Version

No version yet

## Suggestion, Bug Reporting, Contributing

Sorry, the project is a personal project which do not accept any Pull Requests.
You could fork the repo to build your own project.

Any comments and suggestions are always welcome. Please open an [issue][] to contact with me.

## Copyright and License

Copyright (c) 2017-2019 ADoyle. The project is licensed under the **BSD 3-clause License**.

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
[git-prompt]: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
[bash-completion]: https://github.com/scop/bash-completion
