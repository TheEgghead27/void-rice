#!/bin/bash
# xbps-install -Syu &&  # i'll be recommending plain install from web not image buuut
# xbps-install gcc make pkg-config git atop htop vim -y &&  # install build tools and a few utilities
xbps-install bspwm feh font-awesome5 maim picom polybar pulseaudio rofi scrot sxhkd xclip xcompmgr -y &&  # install bspwm thing
# copy mandatory config files
# in theory if doas with preserve env is set, ~ will be towards the user directory
# using a potentially breakable way to do the home directory
install -Dm755 /usr/share/doc/bspwm/examples/bspwmrc "/home/$(logname)/.config/bspwm/bspwmrc" &&
	install -Dm644 /usr/share/doc/bspwm/examples/sxhkdrc "/home/$(logname)/.config/sxhkd/sxhkdrc" &&
sed -i 's/urxvt/st/' "/home/$(logname)/.config/sxhkd/sxhkdrc" &&
# echo "\nprint_screen\n\tscrot"  >> ~/.config/sxhkdrc
# attempt to put print screen keybind
# my favorite part :)
xbps-install libXinerama-devel libXft-devel libXext-devel ncurses-devel -y &&
git submodule update --init --recursive &&  # ensure submodules
cd suckless &&
cd st &&
make clean install && 
cd .. &&
cd dmenu &&
make clean install &&

echo "exec bspwm" > "/home/$(logname)/.xinitrc"
