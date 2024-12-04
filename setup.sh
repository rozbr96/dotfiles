#!/bin/zsh

DOTFILES_DIR=$(pwd)

SYMLINKS_TO_BE_CREATED=(
  .config/hypr/hyprland.conf
  .gitconfig
  .vimrc
  .zprofile
  .zsh/aliases
  .zshrc.local
)

DIRS=(
  .config/hypr
  .zsh
)


function create_config_dirs() {
  echo "Creating required dirs... "

  cd ~

  for dir in $DIRS; do
    echo -n "Creating dir for $dir... "
    mkdir -p $dir
    echo "CREATED!"
  done

  echo "DONE CREATING DIRS!\n"

  cd -
}


function create_symlinks() {
  cd ~

  echo "Creating symlinks..."

  for fd in $SYMLINKS_TO_BE_CREATED; do
    echo -n "Creating symlink for $fd... "
    ln -fs $DOTFILES_DIR/$fd $fd
    echo "CREATED!"
  done

  echo "DONE CREATING SYMLINKS!\n"

  cd -
}


function install_deps() {
  echo "Installing some deps..."
  yay -S --noconfirm \
    cmake \
    cpio \
    meson \
    hy3 \
    pkg-config \
    python-pynvim \
    kitty \
    uwsm \
    vundle \
    $(pacman -Ssq hypr)
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
  create_config_dirs
  create_symlinks
  install_yay
  install_deps
  install_vim_plugins
}


setup

