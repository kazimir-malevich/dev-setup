#!/bin/bash

set -e

setup_all() {
  sudo apt -y update && sudo apt -y upgrade
  rm -rf $HOME/.vim
}

setup_git() {
  sudo apt install git
  wget -O $HOME/.gitconfig https://raw.githubusercontent.com/kazimir-malevich/dotfiles/master/.gitconfig
}

setup_vim() {
  plugins_start_dir="$HOME/.vim/pack/plugins/start/"

  sudo apt install vim
  wget -O $HOME/.vimrc https://raw.githubusercontent.com/kazimir-malevich/dotfiles/master/.vimrc

  mkdir -p $plugins_start_dir && cd $plugins_start_dir

  declare -a plugins
  plugins=("dense-analysis/ale.git" "tpope/vim-commentary" "ctrlpvim/ctrlp.vim.git")
  cd $plugins_start_dir

  for i in ${plugins[@]}; do
    git clone "https://github.com/${i}"
  done
}

teardown_all() {
  sudo apt -y autoremove
}

setup_all
setup_git
setup_vim
teardown_all
