# Changelog

All notable changes to this project will be documented in this file.

The format is inspired by [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## Change Types

- Add: for new features.
- Change: for changes in existing functionality.
  - style: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
  - refactor: A code change that neither fixes a bug nor adds a feature
  - perf: A code change that improves performance
  - test: Adding missing or correcting existing tests
  - chore: Changes to the build process or auxiliary tools and libraries such as documentation generation
- Breaking Change: for changes which incompatible with previous version in existing functionality
- Deprecate: for soon-to-be removed features.
- Remove: for now removed features.
- Fix: for any bug fixes.
- Security: in case of vulnerabilities.
- Documentation: Documentation only changes.

## Unreleased

- Add a bootstrap script to get things done by one-click
- User customized plugin system

## [v0.3.0] - 2018-02-01 21:01:17 +0800

[Full Changelog](https://github.com/adoyle-h/dotfiles/compare/v0.2.0...v0.3.0)

### Breaking Change

- update: bash_it/reset.sh => bash_it/reset, make it executable
- upgrade bash-it to latest. You should use `-b a/1.0.0` instead of `-b theme/a`

### Add

- add: ranger
- feat: create $HOME/.bashrc.debug for debug
- feat: use ~/.fast_bashrc for rescue
- add(submodule): nvim and cheat
- add(bin/sub): a find
- update(bash): add alias fpp -ni
- update(completion): add adoyle-cli and itmz completion
- add(bin/sub): proc-env

### Change

- update(tmux): update plugin config
- update(bin/sub): 256color defaults to print all colors (1~255) && support ls0~3
- update: modify bash_it/reset.sh && move bash-it-enables to bin
- update(config): stylelintrc
- update: move rmrf from bin/sub to bin/

### Documentation

- add description of ~/.fast_bashrc
- add description of ~/.bashrc.debug
- modify git address of bash_it, use `-b a/1.0.0` instead of `-b theme/a`
- update copyright dates

### Fix

- fix: disable GREP_COLOR and alt-numkey modification while in non-login shell


## [v0.2.0] - 2017-11-03 03:32:13 +0800

[Full Changelog](https://github.com/adoyle-h/dotfiles/compare/v0.1.0...v0.2.0)

### Breaking Change

- change symbol link from `~/.completions` to `~/.bash_completions`
- update the based framework [adoyle-h/bash-it](https://github.com/adoyle-h/bash-it) to latest with breaking changes

### Add

- add Changelog
- add bin/sub: rmrf

### Change

- `a help` print summary text

### Documentation

- add description of Bash Completions
- fix installation && update workflow

### Fix

- fix custom bash-completions

## [v0.1.0] - 2017-10-28 22:25:59 +0800

### Add

- Initial stable version release



<!-- links -->

[v0.1.0]: https://github.com/adoyle-h/dotfiles/tree/v0.1.0
[v0.2.0]: https://github.com/adoyle-h/dotfiles/tree/v0.2.0
[v0.3.0]: https://github.com/adoyle-h/dotfiles/tree/v0.3.0
