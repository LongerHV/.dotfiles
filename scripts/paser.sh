#!/bin/sh

# Interactive sarch and install pacman packages

export FZF_DEFAULT_OPTS='
--height=30%
--layout=reverse
--prompt="Package: "'

package=$(pacman -Ss | \
    awk 'NR % 2 == 1 { print $1 }' | \
    fzf)

[ -z "$package" ] && exit 1
pacman -Si $package | less
package_short=$(echo $package | awk -F'/' '{print $2}')

echo ":: Selected package: $package"
pacman -Qq $package_short &> /dev/null && echo ":: Package already in the system"
read -p ":: Install package? [y/N] " ans
if [ "$ans" == "y" ]
then
    sudo pacman -S $package
    exit $?
else
    exit 1
fi

