# Advanced Usage

There are many tricks you may be interested.

## TOC

<!-- MarkdownTOC GFM -->

- [Create symbolic links](#create-symbolic-links)
- [Use ~/.fast_bashrc for rescue](#use-fast_bashrc-for-rescue)
- [Debug Dotfiles startup](#debug-dotfiles-startup)
- [Customize your Bash by plugin](#customize-your-bash-by-plugin)
- [Enable plugin for specific system](#enable-plugin-for-specific-system)
- [Other modifications](#other-modifications)
- [Write a sub-command](#write-a-sub-command)
    - [sub-command document](#sub-command-document)
    - [sub-command completion](#sub-command-completion)
- [Secret Data](#secret-data)
- [Bash Completions](#bash-completions)

<!-- /MarkdownTOC -->

## Create symbolic links

This feature benefits from [dotbot][].
Edit `install.conf.yaml`.
Run `./install` to (re)create symbolic links.

**Attention: Do not call the script under sudo.**

## Use ~/.fast_bashrc for rescue

If Dotfiles has any critical issue, you could create a `~/.fast_bashrc` file and restart shell to override `~/.bashrc`.

## Debug Dotfiles startup

Invoke `a debug open` or `touch ~/.bashrc.debug` and restart shell. You will see the debug logs from stdout.

Invoke `a debug close` or `rm ~/.bashrc.debug` and restart shell will turn off debug logs.

## Customize your Bash by plugin

You can customize Bash by making a plugin.
All custom plugins must be put in [`bash-custom/available/`](../bash-custom/available) and filename must be suffixed with `.plugin.bash`.

Below content as template,

```sh
# BASH_IT_LOAD_PRIORITY: 300
cite about-plugin
about-plugin 'Plugin description'

# put your shellscript codes here
```

`# BASH_IT_LOAD_PRIORITY: 300` means the load priority of plugin is 300. It is optional, defaults to 300.
All custom plugins are loaded by framework in order (from 1 to 999).

Then you can invoke `a plugins-enable <plugin-name>` and restart shell to enable the plugin.

## Enable plugin for specific system

- `a plugins-enable macos`
- `a plugins-enable debian`

## Other modifications

Sometimes, you could modify the files in `bash_it/` for prior execution.

DO NOT CHANGE ANYTHING IN [`bash/`](../bash/) folder.

## Write a sub-command

These executables could also be put in [`bin/sub/`]('../bin/sub/') which is included in `$PATH`,
and it could be referred as sub-command.

### sub-command document

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

### sub-command completion

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

## Secret Data

If you want keep your sensitive data untracked from git.
Create a `secrets.plugin.bash` and make a soft-link points to it. Such as `ln -s <your-path>/secrets.plugin.bash ./bash-custom/secrets.plugin.bash`.
All files under `bash-custom/enabled/` are untracked.
Then type `a plugins-enable secrets` and restart shell to enable it.

So, you could maintain your classified data in your `secrets.plugin.bash`.

## Bash Completions

Put your completion files under [`completions/`](../completions).

The completion files loaded in order:

- bash_completion will load files in order:
  - ${BASH_COMPLETION_COMPAT_DIR:-/usr/local/etc/bash_completion.d}
  - ${BASH_COMPLETION_USER_FILE:-~/.bash_completion}
- this plugin will load
  - $HOME/.bash_completions

Notice: this directory does not work for your sub-command completion.

<!-- links -->

[dotbot]: https://github.com/anishathalye/dotbot/
