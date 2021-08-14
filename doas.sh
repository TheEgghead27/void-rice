#/bin/bash
xbps-install doas &&
echo "permit persist keepenv :wheel as root" > /etc/doas.conf &&
echo "ignorepkg=sudo" > /etc/xbps.d/sudo.conf &&
xbps-remove sudo
