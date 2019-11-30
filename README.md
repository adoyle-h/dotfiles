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
- [Related Projects](#related-projects)
- [Inspired By](#inspired-by)
- [Installation](#installation)
    - [Bootstrap](#bootstrap)
- [Configuration](#configuration)
    - [User Modifications](#user-modifications)
    - [UI](#ui)
    - [Dotfiles](#dotfiles)
- [Usage](#usage)
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
- Manage shell scripts/completions/aliases/plugins by modules.
  - Most features are implemented in separate plugins, which could be disabled by yourself.
  - All my plugins are put in [`bash_it/plugins/available/`](./bash_it/plugins/available/). `a plugins-list -a` to print all plugin names.
- Compatible with [bash-completion][] (for bash 3.x) and [bash-completion2][bash-completion] (for bash 4.x). See the [configuration](https://github.com/adoyle-h/dotfiles/blob/master/bash_it/completions.bash)
- Responsive and pretty prompt. Refer to [Preview](#preview).
- Collections of shell commands, which locates in [`bin/`](./bin/). Refer to [Binary executables](#binary-executables).
- Managed sub-commands in [`bin/sub/`](./bin/sub/). The sub-commands framework is modified from [sub][].
  - Invoke `a plugins-enable sub` to enable this feature. See [Sub-commands](#sub-commands) for more details.
- Integrated all my best practices with shell (bash).
  - Extended keyboard bindings. See [keymap.plugin.bash](./bash_it/plugins/available/keymap.plugin.bash).
  - Flexible completion. Tab and Shift+Tab to make completion in circle. See [completion.plugin.bash](./bash_it/plugins/available/completion.plugin.bash)
  - Extended Bash history settings. See [history.plugin.bash](./bash_it/plugins/available/history.plugin.bash).
  - Extended Bash manpage. See [manpage.plugin.bash](./bash_it/plugins/available/manpage.plugin.bash).
  - Patch shell for macos. See [macos.plugin.bash](./bash_it/plugins/available/macos.plugin.bash).
  - Set some mirror hosts for users in China.
  - Pretty ls command. See [ls.plugin.bash](./bash_it/plugins/available/ls.plugin.bash).
  - Pretty less command. See [lesspipe.plugin.bash](./bash_it/plugins/available/lesspipe.plugin.bash).
  - Safe rm command. See [rm.plugin.bash](./bash_it/plugins/available/rm.plugin.bash).
  - Support [Secret Data](#secret-data).
  - Support true color.
- Many third integrations
  - [z.lua](https://github.com/skywind3000/z.lua). See [zl.plugin.bash](./bash_it/plugins/available/zl.plugin.bash).
  - [fzf][]. See [the configuration](https://github.com/adoyle-h/dotfiles/blob/master/bash-custom/fzf.plugin.bash) and [fzf.plugin.bash](./bash_it/plugins/available/fzf.plugin.bash).
  - [taskbook](https://github.com/klaussinani/taskbook).
  - [cheat](https://github.com/cheat/cheat). See [cheat.plugin.bash](./bash_it/plugins/available/cheat.plugin.bash)
  - My best practices with [neovim][]. See [nvim.plugin.bash](./bash_it/plugins/available/nvim.plugin.bash) and [my neovim configuration][neovim-config].
  - My best practices with [tmux][]. See [tmux.plugin.bash](./bash_it/plugins/available/tmux.plugin.bash) and [./configs/tmux.conf](./configs/tmux.conf).
  - My best practices with git. See [git.plugin.bash](./bash_it/plugins/available/git.plugin.bash) and [./configs/gitconfig](./configs/gitconfig).
  - My cheat sheets based on [chrisallenlane/cheat](https://github.com/chrisallenlane/cheat).
  - Support [bash-preexec][]. It provides preexec and precmd functions for Bash just like Zsh. See [preexec.plugin.bash](./bash_it/plugins/available/preexec.plugin.bash).
  - Support vscode. See [vscode.plugin.bash](./bash_it/plugins/available/vscode.plugin.bash).
  - Support GNU utilities. See [gnu.plugin.bash](./bash_it/plugins/available/gnu.plugin.bash).
  - Support programming language related like nvm, rust, gvm.

## Preview

![preview.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/dotfiles/preview.png)

The prompt is implemented by [a-bash-prompt][]. See [prompt.plugin.bash](./bash_it/plugins/available/prompt.plugin.bash).

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

## Related Projects

- [dotbot][]: A tool that bootstraps your dotfiles.
- [lobash](https://github.com/adoyle-h/lobash): A modern, safe, powerful utility library for Bash script development.
- [a-bash-prompt][]: A Bash prompt written by pure Bash script.
- [bash-sensible](https://github.com/mrzool/bash-sensible): An attempt at saner Bash defaults.
- [tmux][]: An awesome terminal multiplexer!
- [neovim][]: Vim-fork focused on extensibility and usability
- [neovim-config][]: My neovim config

## Inspired By

- [sub][]: A delicious way to organize programs created by basecamp. But no more maintained.
- [bash-it][]: A community Bash framework.

## Installation

```sh
# Set your Dotfiles directory path
DOTFILES_DIR=~/dotfiles

# Clone this repo
git clone --depth 1 https://github.com/adoyle-h/dotfiles.git $DOTFILES_DIR
cd $DOTFILES_DIR
# Clone submodules and initialize them
git submodule update --init --recursive

# You may check the content of `dotbot.conf.yaml` file,
# It creates soft-links based on dotbot.conf.yaml.
./dotbot
# Checkout the output

# Restart your shell

# Enable recommend plugins
. ${DOTFILES_DIR}/bootstraps/recommends/plugs
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

- Font: [DejaVuSansMonoForPowerline Nerd Font Book][font]
- Color Scheme: [Deep][color scheme]. [Installation Instructions][color scheme - installation]

### Dotfiles

Edit the [`dotbot.conf.yaml`][dotbot.conf.yaml] file.

## Usage

### Binary executables

All your own binary executables should be put in [`bin`](./bin/) folder, which has been added to `$PATH`.

### Sub-commands

Executable commands could be put in [`bin/sub/`]('./bin/sub/') which has been added to `$PATH`.
These commands are referred as sub-command. Example:

- `a help`
- `a bins` to show all commands in `./bin/`
- `a comments` to show all commands in `./bin/sub/`
- `a 256color`
- `a debug open` and `a debug close` to open/close debug mode

All sub-commands are auto-completed. Type `a <Tab>` to see all sub-commands.

You can modify the enterpoint (`SUB_NAME`) in [sub.plugin.bash](./bash_it/plugins/available/sub.plugin.bash).

### Enable custom plugins

The framework provides many custom [plugins](./plugins/), [aliases](./aliases/), [completions](./completions/).
and some sub-commands to manage them.

- `a enable <type> <name>...` to enable plugins in `bash-custom/available/`
- `a disable <type> <plugin-name>...` to disable plugins in `bash-custom/enabled/`
- `a disable-all <type>` to disable all plugins in `bash-custom/enabled/`
- `a list <type>` to show all enabled plugins in `bash-custom/enabled/`
- `a list <type> -a` to show all plugins in `bash-custom/available/`
- `a backup <type>` to backup all enabled plugins to [custom_plugins][].
- `a recover <type>` to re-enable all plugins saved in [custom_plugins][].

### Plugin Load Priority

Use `# BASH_IT_LOAD_PRIORITY: 500` to set load priority. Defaults to 500.

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
│   └── recommends/
│       └── plugs                   # Enabled recommended plugins/completions/aliaes
├── bootstrap.bash*
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

Copyright (c) 2017-2019 ADoyle. The project is licensed under the **BSD 3-clause License**.

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
[custom_plugins]: ./bootstraps/recommends/custom_plugins
