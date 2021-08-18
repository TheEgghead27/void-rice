#/bin/sh
# xorg-docs menu menu-xdg
xbps-install xorg-minimal xorg-server-common xdg-utils -y
xbps-install libX11-devel libXinerama-devel libXft-dev -y
xbps-install xcompmgr
xbps-install git patch -y
doas -u egg git clone https://git.suckless.org/dwm

mkdir /home/egg/.dwm

cd dwm
# cp config.def.h config.h
# sed -i -e 's/"st",/"gnome-terminal",/g' config.h
make clean install
echo "exec dwm" > /home/egg/.xinitrc
cd ..
doas -u egg git clone https://git.suckless.org/dmenu
cd dmenu
make clean install
cd ..
doas -u egg git clone https://git.suckless.org/st
cd st
make clean install
cd ..
doas -u egg git clone https://git.suckless.org/slstatus
cd slstatus
make clean install
cd ..
echo ""
echo "dwm installed! Run \"startx\" to start dwm."
