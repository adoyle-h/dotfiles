BREW_USE_PROXY=true

mkdir -p ~/bin

git_clone "git@github.com:adoyle-h/one.bash.git" "$DOTFILES_DIR/others/one.bash"
git_clone "git@github.com:adoyle-h/neovim-config.git" "$DOTFILES_DIR/others/nvim"
git_clone "git@github.com:adoyle-h/my-command-cheat.git" "$DOTFILES_DIR/others/cheatsheets-adoyle"
git_clone "git@github.com:adoyle-h/tmux-choose-pane.git" "$DOTFILES_DIR/others/tmux-choose-pane"
git_clone "git@github.com:adoyle-h/forgit.git" "$DOTFILES_DIR/others/forgit"
