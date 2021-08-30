#!/bin/sh
if [ $1 ]
then
	url=$1
else
	url=https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage 
fi
target=~/Applications/nvim.appimage
link=~/.local/bin/nvim
mkdir -p $(dirname ${target})
wget -x -O ${target} ${url} && chmod +x ${target} && ln -sf ${target} ${link}
