#/bin/bash
xbps-install opendoas -y &&
echo "permit persist keepenv :wheel as root" > /etc/doas.conf &&
echo "ignorepkg=sudo" > /etc/xbps.d/sudo.conf &&
xbps-remove sudo -y &&
echo "alias sudo='doas'">> ~/.bashrc 
