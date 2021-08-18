#!/bin/bash

#function powermenu {
options="Shutdown\nRestart\nLock\nCancel"
selected=$(echo -e $options | dmenu)
if [[ $selected = "Shutdown" ]]; then
	doas -n shutdown -P now
elif [[ $selected = "Restart" ]]; then
	doas -n shutdown -r now
elif [[ $selected = "Lock" ]]; then
	slock
elif [[ $selected = "Cancel" ]]; then
	:
fi
#}

#powermenu   # it would be funny if instead of making a function like the tutorial the code was directly run
