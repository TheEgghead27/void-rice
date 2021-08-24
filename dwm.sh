xbps-install feh pulseaudio redshift scrot xclip xcompmgr -y &&
xbps-install imlib2-devel libX11-devel libXft-devel libXinerama-devel libXft-devel libXrandr-devel libXext-devel ncurses-devel xorg -y &&
# no idea if these are needed
# xbps-install libXScrnSaver-devel libXau-devel libXcomposite-devel libXcursor-devel libXdamage-devel libXdmcp-devel libXfixes-devel libXi-devel libXrandr-devel libXrender-devel libXtst-devel libXxf86vm-devel libxcb-devel libxkbcommon-devel libxml2-devel libxshmfence-devel &&
git submodule update --init --recursive &&  # ensure submodules
cd suckless/dwm &&
make clean install &&
cp ../.dwm/powermenu.sh /usr/local/bin/powermenu &&
cp -r ../.dwm /home/$(logname)/ &&
cp ./dwm.desktop /usr/share/xsessions &&
cp ./dwm_badge-symbolic.svg /usr/share/icons/hicolor/scalable/places/ &&
#gtk-update-icon-cache /usr/share/icons/hicolor
cd ../st &&
make clean install &&
cd ../dmenu &&
make clean install &&
cd ../slstatus &&
make clean install &&
cd ../slock &&
make clean install &&

echo "exec dwm" > "/home/$(logname)/.xinitrc"
