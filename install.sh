#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR
export USER
USER='simonfletcher'
DOTFILES_DIR="/Users/$USER/dots"

# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"

# Update dotfiles itself first

if is-executable git -a -d "$DOTFILES_DIR/.git"; then git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master; fi

# Bunch of symlinks

### Asdf
ln -sfv "$DOTFILES_DIR/asdf/.asdfrc" ~
ln -sfv "$DOTFILES_DIR/asdf/.tool-versions" ~

### Gem
ln -sfv "$DOTFILES_DIR/gem/.gemrc" ~

### Git
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore" ~
ln -sfv "$DOTFILES_DIR/git/.gitmessage" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

### Input
ln -sfv "$DOTFILES_DIR/input/.inputrc" ~
ln -sfv "$DOTFILES_DIR/input/.aliases" ~

### Postgres
ln -sfv "$DOTFILES_DIR/psql/.psqlrc" ~

### Ruby
ln -sfv "$DOTFILES_DIR/ruby/.rspec" ~
ln -sfv "$DOTFILES_DIR/ruby/.rubocop.yml" ~

### TMUX
ln -sfv "$DOTFILES_DIR/tmux/.tmux.conf" ~
ln -sfv "$DOTFILES_DIR/tmux/tmuxinator.zsh" ~/.bin/
ln -sfv "$DOTFILES_DIR/tmux/.tmuxinator" ~

### Vim
ln -sfv "$DOTFILES_DIR/vim/.agignore" ~
ln -sfv "$DOTFILES_DIR/vim/.ctags" ~
ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~

### ZSH
ln -sfv "$DOTFILES_DIR/zsh/.zshrc" ~

# Package managers & packages

. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/langs.sh"
. "$DOTFILES_DIR/install/brew-cask.sh"
. "$DOTFILES_DIR/install/zsh.sh"
