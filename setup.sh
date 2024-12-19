#!/bin/zsh

function setup() {
  make create_symlinks
  make install_yay
  make install_deps
  make install_vim_plugins
}


setup
