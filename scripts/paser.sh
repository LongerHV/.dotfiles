#!/bin/sh

export FZF_DEFAULT_OPTS='
--height=30%
--layout=reverse
--prompt="Package: "'

package=$(pacman -Ss | \
    awk 'NR % 2 == 1 { print $1 }' | \
    fzf)

pacman -Si $package | less

[ -z "$package" ] && exit 1
echo ":: Selected package: $package"
read -p ":: Install package? [y/N] " ans
if [ "$ans" == "y" ]
then
    sudo pacman -S $package
    exit $?
else
    exit 1
fi

