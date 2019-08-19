# Awesome Bash Dotfiles

An elegant way to manage dotfiles, commands, completions, configurations for terminal players.

**Make Bash Great Again!**

**Currently, it is only a personal workplace rather than a framework. So you should FORK the REPO first before using it. The framework is coming soon.**

## TOC

<!-- MarkdownTOC GFM -->

- [Environments](#environments)
- [Features](#features)
- [Preview](#preview)
- [Version](#version)
- [Core Dependencies](#core-dependencies)
- [Optional Integrations](#optional-integrations)
- [Related Projects](#related-projects)
- [Inspired By](#inspired-by)
- [Installation](#installation)
    - [Bootstrap](#bootstrap)
- [Configuration](#configuration)
    - [User Modifications](#user-modifications)
    - [UI](#ui)
    - [Soft-links](#soft-links)
- [Usage](#usage)
    - [bashrc](#bashrc)
    - [Binary executables](#binary-executables)
    - [Sub-commands](#sub-commands)
    - [Enable custom plugins](#enable-custom-plugins)
    - [Plugin Load Priority](#plugin-load-priority)
- [File Structure](#file-structure)
- [Bash initialization process](#bash-initialization-process)
- [Advanced Usage](#advanced-usage)
- [Suggestion, Bug Reporting, Contributing](#suggestion-bug-reporting-contributing)
- [Copyright and License](#copyright-and-license)

<!-- /MarkdownTOC -->

## Environments

- ✅ iTerm2 Build 3.0.14 (Terminal.app compatible)
- ✅ GNU bash 4.4+ and 5.0+ (Not support Bash 4.3 and lower versions)
- ✅ Tmux 2.7+ (Not necessary. Tmux compatible)
- ✅ MacOS
- ✅ Linux/Unix system
- 🚫 Windows system
- 🚫 Zsh. This project is just for Bash players. Zsh players should use [Oh My Zsh][].

## Features

- Manage collections of dotfiles. Create soft-link via [dotbot][]. See [the configuration](./dotbot.conf.yaml).
- Manage shell scripts by modules.
  - Most features are implemented in separate plugins, which could be disabled by yourself.
  - All plugins are put in [`plugins/`](./plugins/). `a list plugin -a` to print all available names.
  - All completions are put in [`completions/`](./completions/). `a list completion -a` to print all available names.
  - All aliases are put in [`aliases/`](./aliases/). `a list alias -a` to print all available names.
  - All enabled plugins/completions/aliases are put in `enabled/` directory.
  - You can extend new types.
- Compatible with [bash-completion][] (for bash 3.x) and [bash-completion2][bash-completion] (for bash 4.x).
- Responsive and pretty prompt. Refer to [Preview](#preview).
- Collections of shell commands, which locates in [`bin/`](./bin/). Refer to [Binary executables](#binary-executables).
- Managed sub-commands in [`bin/sub/`](./bin/sub/). The sub-commands framework is modified from [sub][].
- Define XDG Environment variables which follow [XDG Base Directory Specification](https://wiki.archlinux.org/index.php/XDG_Base_Directory). See [./bash/xdg.bash](./bash/xdg.bash).
- Integrated all my best practices with shell (bash).
  - Extended keyboard bindings. See [./plugins/keymap.bash](./plugins/keymap.bash).
  - Flexible completion. Tab and Shift+Tab to make completion in circle. See [./plugins/completion.bash](./plugins/completion.bash)
  - Extended Bash history settings. See [./plugins/history.bash](./plugins/history.bash).
  - Extended Bash manpage. See [./plugins/manpage.bash](./plugins/manpage.bash).
  - Patch shell for macos. See [./plugins/macos.bash](./plugins/macos.bash).
  - Pretty ls command. See [./plugins/ls.bash](./plugins/ls.bash).
  - Pretty less command. See [./plugins/lesspipe.bash](./plugins/lesspipe.bash).
  - Safe rm command. See [./plugins/rm.bash](./plugins/rm.bash).
  - Support [Secret Data](./docs/advanced-usages.md#secret-data).
  - Support true color.
  - Set some mirror hosts for users in China.
- Many third integrations
  - [z.lua][]. See [./plugins/zl.bash](./plugins/zl.bash).
  - [fzf][]. See [the configuration](https://github.com/adoyle-h/dotfiles/blob/master/bash-custom/fzf.plugin.bash) and [./plugins/fzf.bash](./plugins/fzf.bash).
  - [taskbook](https://github.com/klaussinani/taskbook).
  - [cheat](https://github.com/cheat/cheat). See [./plugins/cheat.bash](./plugins/cheat.bash)
  - My best practices with [neovim][]. See [./plugins/nvim.bash](./plugins/nvim.bash) and [my neovim configuration][neovim-config].
  - My best practices with [tmux][]. See [./plugins/tmux.bash](./plugins/tmux.bash) and [./configs/tmux.conf](./configs/tmux.conf).
  - My best practices with git. See [./plugins/git.bash](./plugins/git.bash) and [./configs/gitconfig](./configs/gitconfig).
  - My cheat sheets based on [chrisallenlane/cheat](https://github.com/chrisallenlane/cheat).
  - Support [bash-preexec][]. It provides preexec and precmd functions for Bash just like Zsh. See [./plugins/preexec.bash](./plugins/preexec.bash).
  - Support vscode. See [./plugins/vscode.bash](./plugins/vscode.bash).
  - Support GNU utilities for mac. See [./plugins/gnutools-for-mac.bash](./plugins/gnutools-for-mac.bash) and [./plugins/sed-for-mac.bash](./plugins/sed-for-mac.bash).
  - Support programming language related like nvm, rust, gvm.

## Preview

![preview.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/dotfiles/preview.png)

The prompt is implemented by [a-bash-prompt][]. See [./plugins/prompt.bash](./plugins/prompt.bash).

Responsive prompt. Press Enter to auto adjust with window width.

![responsive-prompt.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/a-bash-prompt/responsive-prompt.png)

Show last command exit status

![exit-status.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/a-bash-prompt/exit-status.png)

Highlight Backgound jobs:

![jobs-labels.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/a-bash-prompt/jobs-labels.png)

Use sub commands:

![sub-commands.jpeg](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/dotfiles/sub-commands.jpeg)

## Version

See [releases](https://github.com/adoyle-h/dotfiles/releases).

## Core Dependencies

- [python][]: **It is required**. Make sure it available before installation. Python 2 and 3 are both supported.
- [git][]: **It is required**. Make sure it available before installation.
  - [git-prompt][]: If omitted, PS1 will not show git prompt.
- [dotbot][]: To create symbolic links and manage them by [`dotbot.conf.yaml`](./dotbot.conf.yaml). No need to install it manually. It is a submodule of project.

## Optional Integrations

These integrations are not required for the project. It will improve the experience of terminal. Install them by yourself.

- [exa](https://github.com/ogham/exa)
- [cheat](https://github.com/cheat/cheat)
- [fzf][]
- [ag](https://github.com/ggreer/the_silver_searcher)
- [tmux][]: An awesome terminal multiplexer!
- [trash](https://github.com/sindresorhus/trash-cli)
- [z.lua][]

## Related Projects

- [dotbot][]: A tool that bootstraps your dotfiles.
- [lobash](https://github.com/adoyle-h/lobash): A modern, safe, powerful utility library for Bash script development.
- [a-bash-prompt][]: A Bash prompt written by pure Bash script.
- [bash-sensible](https://github.com/mrzool/bash-sensible): An attempt at saner Bash defaults.
- [neovim][]: Vim-fork focused on extensibility and usability
- [neovim-config][]: My neovim config

## Inspired By

- [sub][]: A delicious way to organize programs created by basecamp. But no more maintained.
- [bash-it][]: A community Bash framework.

## Installation

```sh
# Set your Dotfiles directory path
DOTFILES_DIR=~/dotfiles

git clone --depth 1 https://github.com/adoyle-h/dotfiles.git $DOTFILE_DIR

cd $DOTFILE_DIR
./install $DOTFILE_DIR
```

And then read the [Configuration - User Modifications](#user-modifications) section.

### Bootstrap

**IT IS UNDER DEVELOPMENT. DO NOT USE!**

Run `./bootstrap` to initialize in a new environment.

**Do not call the script under sudo.**

## Configuration

### User Modifications

These parts of below files you should modify.

./configs/gitconfig:

```
[user]
    name = <your-username>
    email = <your-email>
```

### UI

`$TERM` should be `xterm-256color` or `screen-256color` for best appearance.

- Font: [DejaVuSansMonoForPowerline Nerd Font][font]
- Color Scheme: [Deep][color scheme]. [Installation Instructions][color scheme - installation]

### Soft-links

Edit the [`dotbot.conf.yaml`][dotbot.conf.yaml] file.

## Usage

### bashrc

The bashrc file is managed by yourself. You must `export DOTFILES_DIR` points to dotfiles directory.

For example,

```sh
# ~/.bashrc: executed by bash(1) for non-login shells.

# Only execute this file once
[[ -n "${_BASHRC_LOADED:-}" ]] && return
_BASHRC_LOADED=true

export DOTFILES_DIR=$HOME/dotfiles
readonly DOTFILES_SUB=a
source "$DOTFILES_DIR/bash/entry.bash"
```

### Binary executables

All your own binary executables should be put in [`bin`](./bin/) folder, which has been added to `$PATH`.

### Sub-commands

Executable commands could be put in [`bin/sub/`]('./bin/sub/') .
These commands are referred as sub-commands. For example,

- `a help` to show help information
- `a bins` to show all commands in `./bin/`
- `a comments` to show all commands in `./bin/sub/`
- `a debug open` and `a debug close` to open/close debug mode

All sub-commands are auto-completed. Type `a <Tab>` to see all sub-commands.

You can change the trigger word `a` to other word by setting `readonly DOTFILES_SUB=<trigger_word>` in bashrc. If `DOTFILES_SUB` not set, it defaults to `DOTFILES_SUB=sub-bin`.

The path `bin/sub/` is not included in `$PATH`. So you cannot invoke sub-commands directly.

### Enable custom plugins

The framework provides many custom [plugins](./plugins/), [aliases](./aliases/), [completions](./completions/).
and some sub-commands to manage them.

- `a enable <type> <name>...` to enable plugins in `plugins/`
- `a disable <type> <plugin-name>...` to disable plugins in `enabled/`
- `a disable-all <type>` to disable all plugins in `enabled/`
- `a list <type>` to show all enabled plugins in `enabled/`
- `a list <type> -a` to show all plugins in `plugins/`

### Plugin Load Priority

Put `# BASH_IT_LOAD_PRIORITY: <PRIORITY>` at the head of script to set loading priority. The priority defaults to `500`.

General priorities of plugs:

- Plugin: 300~499, default 400
- Completion: 500~699, default 600
- Alias: 700~899, default 800

## File Structure

```
.
├── README.md
├── aliases/                        # Available aliases
├── bash/
│   ├── inputrc                     # Set shortcut Key Character Sequence (keyseq). Link to ~/.inputrc
├── bash/
│   ├── bash_it.lib.bash            # Store essential helper functions for all dotfiles modules
│   ├── bash_profile                # Link to ~/.bash_profile
│   ├── bashrc                      # Link to ~/.bashrc
│   ├── bashrc.failover.bash        # failover for ~/.bashrc
│   ├── check-environment.bash
│   ├── debug.bash
│   ├── enable-plugs.bash
│   ├── entry.bash                  # The entrypoint of dotfiles
│   ├── failover.bash
│   ├── inputrc                     # Link to ~/.inputrc
│   ├── plugable.bash
│   ├── profile                     # Link to ~/.profile
│   ├── sub.bash                    # The entrypoint of SUB command
│   └── xdg.bash                    # Set XDG_ variables
├── bin/                            # Link to ~/bin
├── bootstraps/                     # Scripts for bootstraping
│   └── recommended_plugs*          # Enabled recommended plugins/completions/aliaes
├── bootstrap*                      # To install dotfiles framework and system tools from bare system
├── install*                        # To install dotfiles framework
├── cheat/                          # It is ignored in git. git clone https://github.com/adoyle-h/my-command-cheat cheat
├── completions/                    # Available completions
├── configs/                        # Application configuration
├── docs/                           # The documents of this project
├── dotbot*                         # Create soft-links based on dotbot.conf.yaml
├── dotbot.conf.yaml                # Dotbot configurations
├── deps/                           # Git submodules
│   ├── a-bash-prompt/              # https://github.com/adoyle-h/a-bash-prompt
│   ├── dotbot/                     # https://github.com/anishathalye/dotbot
│   ├── nvim/                       # My neovim configurations.
│   ├── z.lua/                      # https://github.com/skywind3000/z.lua
│   ├── colors.bash
│   ├── dotfiles_l.bash             # Similar to lobash.bash. Work for dotfiles scripts.
│   └── lobash.bash                 # https://github.com/adoyle-h/lobash
├── enabled/                        # Enabled plugins/completions/aliases. soft-link files
│   └── 140---shell.plugin.bash -> ../plugins/shell.bash
├── plugins/                        # Available plugins
│   ├── completions.bash            # General completions and tab complete keymap
│   ├── preexec.bash                # Enable bash-preexec library
│   └── prompt.bash                 # Enable a-bash-prompt
└── secrets/                        # This folder is ignored by git. Put your secret data here.
```

## Bash initialization process

It will execute scripts in order:

1. [./bash/bashrc](./bash/bashrc)
2. [./bash/entry.bash](./bash/entry.bash)
3. [./enabled/*.bash](./enabled/)

## Advanced Usage

If you want to extend the framework. See [this document](./docs/advanced-usages.md).

There are many tricks you may be interested.

## Suggestion, Bug Reporting, Contributing

Any comments and suggestions are always welcome. Please open an [issue][] to contact with me.

## Copyright and License

Copyright (c) 2017-2020 ADoyle. The project is licensed under the **BSD 3-clause License**.

See the [LICENSE][] file for the specific language governing permissions and limitations under the License.

See the [NOTICE][] file distributed with this work for additional information regarding copyright ownership.

<!-- links -->

[issue]: https://github.com/adoyle-h/dotfiles/issues
[LICENSE]: ./LICENSE
[NOTICE]: ./NOTICE

<!-- links -->

[dotbot.conf.yaml]: ./dotbot.conf.yaml
[dotbot]: https://github.com/anishathalye/dotbot/
[bash-it]: https://github.com/Bash-it/bash-it
[sub]: https://github.com/basecamp/sub
[neovim]: https://github.com/neovim/neovim
[neovim-config]: https://github.com/adoyle-h/neovim-config
[tmux]: https://github.com/tmux/tmux
[fzf]: https://github.com/junegunn/fzf
[font]: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DejaVuSansMono
[color scheme]: https://github.com/mbadolato/iTerm2-Color-Schemes#deep
[color scheme - installation]: https://github.com/mbadolato/iTerm2-Color-Schemes#installation-instructions
[gnu-sed]: https://www.gnu.org/software/sed/
[git]: https://github.com/git/git
[git-prompt]: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
[bash-completion]: https://github.com/scop/bash-completion
[Oh My Zsh]: https://github.com/robbyrussell/oh-my-zsh
[bash-preexec]: https://github.com/rcaloras/bash-preexec
[a-bash-prompt]: https://github.com/adoyle-h/a-bash-prompt
[python]: https://www.python.org/
[z.lua]: https://github.com/skywind3000/z.lua
