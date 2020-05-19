#! /bin/bash 

# If the process doesn't exists, start one in background
run() {
	if ! pgrep $1 ; then
		$@ &
	fi
}

# Just as the above, but if the process exists, restart it
run-or-restart() {
	if ! pgrep $1 ; then
		$@ &
	else
		process-restart $@
	fi
}

run lxsession
run nitrogen --restore
run picom
run redshift-gtk -t 5000:3500 -b 0.8:0.8
# run light-locker					# Screen locker
# run xfce4-clipman					# Clipboard management

