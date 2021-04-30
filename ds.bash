#!/bin/bash

set -e

setup() {
  rm -rf "$HOME/.vim"
}

vim() {
  plugins_start_dir="$HOME/.vim/pack/plugins/start"
  sudo apt install vim
  wget -O .vimrc https://raw.githubusercontent.com/kazimir-malevich/dotfiles/master/.vimrc
  mkdir -p $plugins_start_dir
  git clone https://github.com/dense-analysis/ale.git "${plugins_start_dir}/ale"
}

teardown() {
  sudo apt -y autoremove
}

setup
vim
teardown
