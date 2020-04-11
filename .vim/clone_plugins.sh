#!/bin/bash

mkdir ~/.vim/bundle
cd ~/.vim
git clone https://github.com/vim-scripts/AutoClose bundle/AutoClose
git clone https://github.com/ctrlpvim/ctrlp.vim  bundle/ctrlp.vim
git clone https://github.com/yggdroot/indentline bundle/indentline
git clone https://github.com/scrooloose/nerdcommenter  bundle/nerdcommenter
git clone https://github.com/scrooloose/nerdtree bundle/nerdtree
git clone https://github.com/Xuyuanp/nerdtree-git-plugin bundle/nerdtree-git-plugin
git clone https://github.com/vim-airline/vim-airline bundle/vim-airline
git clone https://github.com/tpope/vim-fugitive/ bundle/vim-fugitive
git clone https://github.com/airblade/vim-gitgutter bundle/vim-gitgutter
git clone https://github.com/jistr/vim-nerdtree-tabs.git bundle/vim-nerdtree-tabs
git clone https://github.com/sheerun/vim-polyglot bundle/vim-polyglot
git clone https://github.com/tpope/vim-repeat bundle/vim-repeat
git clone https://github.com/tpope/vim-surround bundle/vim-surround
git clone https://github.com/valloric/youcompleteme
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/ryanoasis/vim-devicons


cd ~/.vim/bundle/youcompleteme
git submodule update --init --recursive
python3 install.py --clang-completer

