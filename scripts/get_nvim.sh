#!/bin/sh

target_dir=~/Applications
target=${target_dir}/nvim.appimage
target_temp=/tmp/nvim.appimage
link=~/.local/bin/nvim

if [ $1 ]
then
	url=$1
else
	url=https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage 
fi

cd ${target_dir}

mkdir -p $(dirname ${target})
mkdir -p $(dirname ${link})

digest=$(curl -sSL ${url}.sha256sum)
echo ${digest} | sha256sum --check - > /dev/null
if [ $? -eq 0 ];
then
	echo "Neovim is already up to date"
	exit 0
else
	wget -x -O ${target_temp} ${url} || exit
	cd /tmp && echo ${digest} | sha256sum --check - || exit
	mv ${target_temp} ${target} && chmod +x ${target}
	ln -sf ${target} ${link}
fi
