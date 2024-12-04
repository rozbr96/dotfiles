#!/bin/zsh

DOTFILES_DIR=$(pwd)

SYMLINKS_TO_BE_CREATED=(
  .gitconfig
  .vimrc
  .zprofile
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
    hyprland-meta-git \
    python-pynvim \
    kitty \
    uwsm \
    vundle
  echo "DONE INSTALLING DEPS!\n"
}


function install_vim_plugins() {
  echo "Installing VIM plugins..."
  vim +PluginInstall +qall
  echo "DONE INSTALLING  VIM PLUGINS!\n"
}


function install_yay() {
  echo "Installing yay..."
  sudo pacman -S --noconfirm go
  mkdir -p yay
  cd yay
  wget https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz
  tar -zxvf yay.tar.gz
  cd yay
  yes | makepkg -sri
  cd ../..
  sudo rm -r yay
  echo "DONE INSTALLING YAY"
}


function setup() {
  create_symlinks
  install_yay
  install_deps
  install_vim_plugins
}


setup

