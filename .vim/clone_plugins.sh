#!/bin/bash

mkdir ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/vim-scripts/AutoClose
git clone https://github.com/ctrlpvim/ctrlp.vim
git clone https://github.com/yggdroot/indentline
git clone https://github.com/scrooloose/nerdcommenter
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/Xuyuanp/nerdtree-git-plugin
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/airblade/vim-gitgutter
git clone https://github.com/jistr/vim-nerdtree-tabs.git
git clone https://github.com/sheerun/vim-polyglot
git clone https://github.com/tpope/vim-repeat
git clone https://github.com/tpope/vim-surround
git clone https://github.com/valloric/youcompleteme
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/ryanoasis/vim-devicons


cd ~/.vim/bundle/youcompleteme
git submodule update --init --recursive
python3 install.py --clang-completer

