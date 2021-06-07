#!/bin/sh
term='alacritty'

cat <<EOF | xmenu | sh &
System
	 Terminal		$term
	漣 QT config	qt5ct
	漣 kvantum		kvantummanager
	 network		nm-connection-editor
	墳 volume		pavucontrol-qt
Virtual
	 Virt-manger	virt-manager
	 Spice			spicy
	 Horizon		vmware-view
Editors
	﬏ VSCode		code
	 VIM			$term -e vim

 Files				pcmanfm-qt
 Brave				brave
 Spotify			spotify
嗢 VLC				vlc
戮 Steam			steam
 Screenshot		screengrab
 Refresh wallpaper	~/repos/styli.sh/styli.sh -r earthporn -w 2560 -h 1440 -m 3 -b bg-fill
 Fix screen	xrandr --output DisplayPort-1 --primary --output DisplayPort-2 --left-of DisplayPort-1 --output HDMI-A-1 --right-of DisplayPort-1 --rotate left

 $(uname -r)	

 Exit			qtile-cmd -o cmd -f shutdown
 Lock			light-locker-command -l
鈴 Suspend			systemctl suspend
ﰇ Reboot		reboot
襤 Shutdown		poweroff
EOF
