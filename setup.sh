#!/bin/zsh

DOTFILES_DIR=$(pwd)

SYMLINKS_TO_BE_CREATED=(
  .gitconfig
  .vimrc
  .zsh
  .zshrc.local
)


function create_symlinks() {
  cd ~

  echo "Creating symlinks..."

  for fd in $SYMLINKS_TO_BE_CREATED; do
    echo -n "Creating symlink for $fd... "
    ln -fs $DOTFILES_DIR/$fd .
    echo "CREATED!"
  done

  echo "DONE CREATING SYMLINKS!\n"

  cd -
}


function install_deps() {
  echo "Installing some deps..."
  yay -S --noconfirm \
    python-pynvim \
    kitty \
    vundle
  echo "DONE INSTALLING DEPS!\n"
}


function install_vim_plugins() {
  echo "Installing VIM plugins..."
  vim +PluginInstall +qall
  echo "DONE INSTALLING  VIM PLUGINS!\n"
}


function setup() {
  create_symlinks
  install_deps
  install_vim_plugins
}


setup

