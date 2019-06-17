# Awesome Bash Dotfiles

An elegant way to manage dotfiles, shell scripts, auto-completion files, configurations for terminal players.

**Currently, it is only a personal workplace rather than a framework. So you should FORK the REPO first before using it.**

## TOC

<!-- MarkdownTOC GFM -->

- [Environments](#environments)
- [Features](#features)
- [Preview](#preview)
- [Version](#version)
- [Core Dependencies](#core-dependencies)
- [Installation](#installation)
    - [Bootstrap](#bootstrap)
- [Configuration](#configuration)
    - [Modifications by yourself](#modifications-by-yourself)
    - [UI](#ui)
    - [Dotfiles](#dotfiles)
- [Usage](#usage)
    - [Binary executables](#binary-executables)
    - [Sub-commands](#sub-commands)
    - [Enable bash-it plugins/aliases/completion](#enable-bash-it-pluginsaliasescompletion)
    - [Enable custom plugins](#enable-custom-plugins)
- [File Structure](#file-structure)
- [Bash initialization process](#bash-initialization-process)
- [Advanced Usage](#advanced-usage)
    - [Use ~/.fast_bashrc for rescue](#use-fast_bashrc-for-rescue)
    - [Use ~/.bashrc.debug for debug](#use-bashrcdebug-for-debug)
    - [Customize your Bash by plugin](#customize-your-bash-by-plugin)
    - [Enable plugin for specific system](#enable-plugin-for-specific-system)
    - [Other modifications](#other-modifications)
    - [Write a sub-command](#write-a-sub-command)
        - [sub-command document](#sub-command-document)
        - [sub-command completion](#sub-command-completion)
    - [Secret Data](#secret-data)
    - [Bash Completions](#bash-completions)
    - [Create symbolic links](#create-symbolic-links)
- [Suggestion, Bug Reporting, Contributing](#suggestion-bug-reporting-contributing)
- [Copyright and License](#copyright-and-license)

<!-- /MarkdownTOC -->

## Environments

- ✅ iTerm2 Build 3.0.14 (Terminal.app compatible)
- ✅ GNU bash 4.4.12(1)-release (x86_64-apple-darwin15.6.0) (Not support Bash 4.3 and lower versions)
- ✅ Tmux 2.7 (Not necessary. Tmux compatible)
- ✅ MacOS
- ✅ Linux/Unix system
- 🚫 Windows system
- 🚫 Zsh. This project is just for Bash players. Zsh players should use [Oh My Zsh][].

## Features

- Manage collections of dotfiles. Create soft-link via [dotbot][]. See [the configuration][install.conf.yaml].
- Manage shell scripts/completions/aliases/plugins by modules via [bash-it][].
  - Most features are implemented in separate plugins, which could be disabled by yourself.
  - All my plugins are put in [`bash_it/plugins/available/`](./bash_it/plugins/available/). `a list-plugins -a` to print all plugin names.
  - Some plugins powered by bash-it. `bash-it show plugins` to print all bash-it plugins.
- Compatible with [bash-completion][] (for bash 3.x) and [bash-completion2][bash-completion] (for bash 4.x). See the [configuration](https://github.com/adoyle-h/dotfiles/blob/master/bash_it/completions.bash)
- Responsive and pretty prompt. Refer to [Preview](#preview).
- Collections of shell commands, which locates in [`bin/`](./bin/). Refer to [Binary executables](#binary-executables).
- Managed sub-commands in [`bin/sub/`](./bin/sub/). The sub-commands framework is modified from [sub][].
  - `a enable-plugin sub` to enable this feature.
  - Default `SUB_NAME=a`, type `a help` for getting help. You can modify the enterpoint (`SUB_NAME`) in Plugin: [sub.plugin.bash](./bash_it/plugins/available/sub.plugin.bash)
  - Refer to [Sub-commands](#sub-commands) for more.
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
- Many third integrations
  - [z.lua](https://github.com/skywind3000/z.lua). See [zl.plugin.bash](./bash_it/plugins/available/zl.plugin.bash).
  - [fzf][]. See [the configuration](https://github.com/adoyle-h/dotfiles/blob/master/bash-custom/fzf.plugin.bash) and [fzf.plugin.bash](./bash_it/plugins/available/fzf.plugin.bash).
  - [taskbook](https://github.com/klaussinani/taskbook).
  - [cheat](https://github.com/cheat/cheat). See [cheat.plugin.bash](./bash_it/plugins/available/cheat.plugin.bash)
  - My best practices with [neovim][]. See [the configuration](https://github.com/adoyle-h/neovim-config) and [nvim.plugin.bash](./bash_it/plugins/available/nvim.plugin.bash).
  - My best practices with [tmux][]. See [the configuration](https://github.com/adoyle-h/dotfiles/blob/master/configs/tmux.conf) and [tmux.plugin.bash]((./bash_it/plugins/available/tmux.plugin.bash).
  - My best practices with git. See [the configuration](https://github.com/adoyle-h/dotfiles/blob/master/configs/gitconfig) and [git.plugin.bash]((./bash_it/plugins/available/git.plugin.bash).
  - My cheat sheets based on [chrisallenlane/cheat](https://github.com/chrisallenlane/cheat).
  - Support [bash-preexec][]. It provides preexec and precmd functions for Bash just like Zsh.
  - Support vscode. See [vscode.plugin.bash]((./bash_it/plugins/available/vscode.plugin.bash).
  - Support GNU utilities. See [gnu.plugin.bash]((./bash_it/plugins/available/gnu.plugin.bash).
  - Support programming language related like nvm, rust, gvm.

## Preview

![preview.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/dotfiles/preview.png)

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

- [python][]: **It is required**. Make sure it available before installation.
- [git][]: **It is required**. Make sure it available before installation.
  - [git-prompt][]: If omitted, PS1 will not show git prompt.
- [dotbot][]: To create symbolic links and manage them by [`install.conf.yaml`][install.conf.yaml]. No need to install it manually. It is a part of this repo.
- [bash-it][]: To manage all shell scripts in modules: aliases, plugins, completions and shell appearance theme. No need to install it manually. It is a part of this repo.

## Installation

```sh
# Set your Dotfiles directory path
DOTFILE_DIR=~/dotfiles

# Clone this repo
git clone --depth 1 https://github.com/adoyle-h/dotfiles.git $DOTFILE_DIR
cd $DOTFILE_DIR
# Clone submodules and initialize them
git submodule update --init --recursive

# Install bash_it framework which is required
./pkgs/bash-it/install.sh --no-modify-config

# You may check the content of `install.conf.yaml` file,
# Then make soft-links for dotfiles
./install
# Checkout the output

# Reload bashrc
. $HOME/.bashrc
# Reset bash-it
. ${DOTFILE_DIR}/bootstraps/reset-bash
```

The `install` script will generated a file `$HOME/.dotfilerc`. **Do not modify or remove it.**

And then read the [Configuration - Modifications by yourself](#modifications-by-yourself) section.

### Bootstrap

**IT IS UNDER DEVELOPMENT. DO NOT USE!**

Run `./bootstrap` to initialize in a new environment.

**Do not call the script under sudo.**

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

### Enable bash-it plugins/aliases/completion

This framework is based on [bash-it][]. All features supported.
Type `bash-it` for help.

Two sub-commands provided:

- `a bash-it-status` to show all aliases/plugins/completions you enabled.
- `a bash-it-status -e` to save all aliases/plugins/completions you enabled.

### Enable custom plugins

Because bash-it not support to private plugins. I write many custom plugins in [bash_it/plugins/](./bash_it/plugins/).
And provide some sub-commands to enable/disable them.

- `a enable-plugin plugin-name1 plugin-name2` to enable plugin in `bash-custom/available/`
- `a disable-plugin plugin-name1 plugin-name2` to disable plugin in `bash-custom/enabled/`
- `a list-plugins` to show all enabled plugins in `bash-custom/enabled/`
- `a list-plugins -a` to show all plugins in `bash-custom/available/`

## File Structure

```
.
├── README.md
├── bash/
│   ├── bash_profile                # Link to ~/.bash_profile
│   ├── bashrc                      # Link to ~/.bashrc
│   ├── fast_bashrc                 # Idle file, just a template
│   ├── inputrc                     # Set shortcut Key Character Sequence (keyseq). Link to ~/.inputrc
│   └── profile                     # Link to ~/.profile
├── bash_it/                        # https://github.com/Bash-it/bash-it#your-custom-scripts-aliases-themes-and-functions
│   ├── aliases.bash                   # It is useless in normal. Use plugins/available/alias.plugin.bash instead
│   ├── completions.bash               # It is useless in normal. Use plugins/available/completion.plugin.bash instead
│   ├── custom/                        # Custom the bash by yourself
│   │   ├── editor.env.bash
│   │   ├── enable-custom-plugins.bash
│   │   ├── env.shell.bash
│   │   ├── optionals.shell.bash       # Shell Optional Behavior settings
│   │   ├── path.env.bash              # Change environment variable PATH
│   │   ├── proxy.env.bash             # Application proxy settings
│   │   └── variables.shell.bash       # Shell Variables settings
│   ├── enable.bash                    # bash_it entry and basic settings
│   ├── lib.bash                       # Store essential helper functions for all dotfiles modules
│   ├── plugins/
│   │   ├── available/                 # Available user custom plugins
│   │   │   ├── preexec.plugin.bash    # Enable bash-preexec library
│   │   │   ├── prompt.plugin.bash     # Enable a-bash-prompt
│   │   │   └── sub.plugin.bash        # If not enabled, `a` command will not work
│   │   └── enabled/                   # Enabled user custom plugins
│   │       └── 180---sub.plugin.bash  # soft-link to file in plugins/available/. The prefix is plugin load priority
│   ├── plugins.bash                   # It is useless in normal.
│   └── themes/                        # Store UI themes for bash
├── bin/                            # Link to ~/bin
│   ├── a -> ./sub-bin              # Enterpoint of `a` commands
│   ├── sub/                        # Collections of sub commands
│   │   ├── commands*
│   │   ├── completions*
│   │   ├── help*
│   │   └── init*                   # Sub init file
│   └── sub-bin*                    # Sub main file
├── bootstraps/                     # Scripts for bootstraping
│   └── recommends/
│       └── custom_plugins          # Backup enabled custom plugins
├── bootstrap -> ./bootstrap.bash*
├── bootstrap.bash*
├── cheat/                          # It is ignored in git. git clone https://github.com/adoyle-h/my-command-cheat cheat
├── completions/                    # Bash command completions. Link to ~/.bash_completions
│   └── others/
│       └── sub.bash                # Loaded by sub.plugin.bash
├── configs/                        # Application configuration
├── docs/                           # The documents of this project
├── install*
├── install.conf.yaml               # Dotbot configurations
├── pkgs/                           # Git submodules
│   ├── bash-it/                    # https://github.com/Bash-it/bash-it
│   ├── dotbot/                     # https://github.com/anishathalye/dotbot
│   ├── nvim/                       # My neovim configurations.
│   └── z.lua/                      # https://github.com/skywind3000/z.lua
└── secrets/                        # This folder is ignored by git, no worry about data leaking
```

## Bash initialization process

It will execute scripts in order:

1. [./bash/bashrc](./bash/bashrc)
    - Read "$HOME"/.dotfilerc to detect the path of Dotfiles project directory
2. $HOME/.bash_it.bash => [./bash_it/enable](./bash_it/enable.bash)
3. pkgs/bash-it/bash_it.sh : Start bash_it framework
    - pkgs/bash-it/lib.bash
    - [./bash_it/lib.bash](./bash_it/lib.bash)
    - pkgs/bash-it/scripts/reloader.bash : reloads enabled bash-it plugins
    - pkgs/bash-it/aliases.bash
    - pkgs/bash-it/completions.bash
    - pkgs/bash-it/plugins.bash
    - [./bash_it/aliases.bash](./bash_it/aliases.bash)
    - [./bash_it/plugins.bash](./bash_it/plugins.bash)
    - [./bash_it/completions.bash](./bash_it/completions.bash)
    - If `BASH_IT_THEME` set
        - pkgs/bash-it/lib/appearance.bash
        - [./bash_it/themes/**/*.theme.bash](./bash_it/themes/𝕬/𝕬.theme.bash)
4. [./bash_it/custom/*.bash](./bash_it/custom/)
    - [./bash_it/custom/enable-custom-plugins.bash](./bash_it/custom/enable-custom-plugins.bash)
        - [./bash_it/plugins/enabled/*.bash](./bash_it/plugins/enabled/)


## Advanced Usage

### Use ~/.fast_bashrc for rescue

If `.bashrc` has any critical issue, you could create a `~/.fast_bashrc` file to replace `~/.bashrc`. Restart your shell to reload `.fast_bashrc`.

### Use ~/.bashrc.debug for debug

`touch ~/.bashrc.debug` and restart shell. You will see the debug logs from stdout.

Remove `~/.bashrc.debug` and restart shell will turn off debug logs.

### Customize your Bash by plugin

You can customize Bash by making a plugin.
All custom plugins must be put in [`bash-custom/available/`](./bash-custom/available) and filename must be suffixed with `.plugin.bash`.

Below content as template,

```sh
cite about-plugin
about-plugin 'Plugin description'

# put your shellscript codes here
```

Then you can invoke `a enable-plugin <plugin-name>` to enable the plugin.

### Enable plugin for specific system

- `a enable-plugin macos`
- `a enable-plugin debian`

### Other modifications

Sometimes, you could modify the files in `bash_it/` for prior execution.

DO NOT CHANGE ANYTHING IN [`bash/`](./bash/) folder.

### Write a sub-command

These executables could also be put in [`bin/sub/`]('./bin/sub/') which is included in `$PATH`,
and it could be referred as sub-command.

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
if [[ "${1:-}" = "--complete" ]]; then
  ls
  exit 0
fi
```

or

```sh
# Provide sub completions
if [[ "${1:-}" = "--complete" ]]; then
  if [[ $COMP_CWORD -lt 3 ]]; then
    echo "open close --help"
  fi
  exit 0
fi
```

or

```sh
# Provide sub completions
if [[ "${1:-}" == "--complete" ]]; then
  if [[ $COMP_CWORD -lt 3 ]]; then
    result=$(compgen -f "$2")
    if [[ -d $result ]]; then
      compgen -f "$result/"
    else
      echo "${result[@]}"
    fi
  fi
  exit 0
fi
```

The code comments `# Provide sub completions` is required. Otherwise the completion not work.

Refer to https://github.com/basecamp/sub#autocompletion .

### Secret Data

If you want keep your sensitive data untracked from git.
Create a `secrets.plugin.bash` and make a soft-link points to it. Such as `ln -s <your-path>/secrets.plugin.bash ./bash-custom/secrets.plugin.bash`.
All files under `bash-custom/enabled/` are untracked.
Then type `a enable-plugin secrets` and restart shell to enable it.

So, you could maintain your classified data in your `secrets.plugin.bash`.

### Bash Completions

Put your completion files under `completions/`.

Attention: this directory does not work for your sub-command completion.

### Create symbolic links

This feature benefits from [dotbot][].
Edit `install.conf.yaml`.
Run `./install` to create symbolic links.

**Do not call the script under sudo.**

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
[sub]: https://github.com/basecamp/sub
[neovim]: https://github.com/neovim/neovim
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
