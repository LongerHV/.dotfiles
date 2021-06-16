#!/bin/sh

# Interactive sarch and install pacman packages

export FZF_DEFAULT_OPTS='
--height=30%
--layout=reverse
--prompt="Package: "'

package=$(pacman -Ssq | fzf)

[ -z "$package" ] && exit 1
pacman -Si $package | less

echo ":: Selected package: $package"
pacman -Qq $package 1> /dev/null 2>&1 && echo ":: Package already in the system"
read -p ":: Install package? [y/N] " ans
if [ "$ans" = "y" ]
then
    sudo pacman -S $package
    exit $?
else
    exit 0
fi

