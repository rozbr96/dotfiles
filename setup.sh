#!/bin/zsh

DOTFILES_DIR=$(pwd)

SYMLINKS_TO_BE_CREATED=(
  .config/hypr
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
    ([[ ! -e $fd ]]  && ln -s $DOTFILES_DIR/$fd $fd && echo "DONE!") || echo "SKIPPED! [already exists]"
  done

  echo "DONE CREATING SYMLINKS!\n"

  cd -
}


function install_deps() {
  echo "Installing some deps..."
  yay -S --noconfirm \
    atool \
    cmake \
    cpio \
    ffmpegthumbnailer \
    highlight \
    hy3 \
    imagemagick \
    mediainfo \
    meson \
    odt2txt \
    pkg-config \
    poppler \
    python-pillow \
    python-pynvim \
    kitty \
    ranger \
    uwsm \
    vundle \
    w3m \
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
  create_symlinks
  install_yay
  install_deps
  install_vim_plugins
}


setup

