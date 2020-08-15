#!/bin/sh

cat <<EOF | xmenu | sh &
System
	 Terminal		alacritty
	漣 lxappearance	lxappearance
	漣 kvantum		kvantummanager
Virtual
	 Virt-manger	virt-manager
	 Spice			spicy
	 Horizon		vmware-view
Editors
	﬏ VSCode		code
	 VIM			alacritty -e vim

 Files			thunar
 Brave			brave
 Spotify		spotify
嗢 VLC			vlc
戮 Steam		steam
 Screenshot	screengrab

 $(uname -r)	

 Exit			qtile-cmd -o cmd -f shutdown
 Lock			light-locker-command -l
ﰇ Reboot		reboot
襤 Shutdown		poweroff
EOF
