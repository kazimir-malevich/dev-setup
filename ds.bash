#!/bin/bash

set -e

declare -A arr

setup() {
  rm -rf "$HOME/.vim"
}

vim() {
  plugins_start_dir="$HOME/.vim/pack/plugins/start"
  sudo apt install vim
  wget -O $HOME/.vimrc https://raw.githubusercontent.com/kazimir-malevich/dotfiles/master/.vimrc
  mkdir -p $plugins_start_dir

  arr["ale"]="dense-analysis/ale.git"
  for key in ${!arr[@]}; do
    echo ${key} ${arr[${key}]}
    git clone "https://github.com/${arr[${key}]}" "${plugins_start_dir}/${key}"
  done
}

teardown() {
  sudo apt -y autoremove
}

setup
vim
teardown
