#! /bin/zsh

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

# run nitrogen --restore                      # wallpaper
run /bin/bash "$HOME/scripts/bing_image.sh"
run-or-restart picom                                   # compositor
run-or-restart redshift-gtk -t 5000:3500 -b 0.8:0.8    # redshift
run-or-restart lxpolkit                                # policy kit
run-or-restart jack_control start                      # jack2 audio server
run-or-restart light-locker                            # screen locker
run-or-restart clipmenud                               # clipboard manager

