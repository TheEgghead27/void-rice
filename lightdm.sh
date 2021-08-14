#/bin.bash
# requires essentials.sh to be set up
# xbps-install make pkg-config git vim &&
xbps-install lightdm lightdm-webkit2-greeter dbus-elogind &&
cd /usr/share/lightdm-webkit/themes &&
git clone https://github.com/ffwff &&
# set webkit2 to use modern
# set lightdm to invoke webkit2
ln -s /etc/sv/lightdm /var/service &&
ln -s /etc/sv/acpid /var/service &&
ln -s /etc/sv/dbus /var/service &&
ln -s /etc/sv/polkitd /var/service &&
ln -s /etc/sv/uuidd /var/service
