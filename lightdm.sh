#!/bin/bash
# requires essentials.sh to be set up
# xbps-install make pkg-config git vim &&
xbps-install lightdm lightdm-webkit2-greeter dbus-elogind -y &&
cd /usr/share/lightdm-webkit/themes &&
git clone https://github.com/ffwff/modern &&
# set webkit2 to use modern
sed -i 's/= void/= modern'
# set lightdm to invoke webkit2
sed -i 's/#greeter-session=example-gtk-gnome/greeter-session=lightdm-webkit2-greeter' /etc/lightdm/lightdm.conf
ln -s /etc/sv/lightdm /var/service &&
ln -s /etc/sv/acpid /var/service &&
ln -s /etc/sv/dbus /var/service &&
ln -s /etc/sv/polkitd /var/service &&
ln -s /etc/sv/uuidd /var/service
