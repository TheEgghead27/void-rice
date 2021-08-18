#!/bin/bash
cd dwm
curl -O https://lists.suckless.org/dev/att-7590/shiftview.c
curl -O https://dwm.suckless.org/patches/autostart/dwm-autostart-20210120-cb3f58a.diff
curl -O https://dwm.suckless.org/patches/fullgaps/dwm-fullgaps-20200508-7b77734.diff 

patch < dwm-autostart-20210120-cb3f58a.diff 
patch < dwm-fullgaps-20200508-7b77734.diff

mkdir ~/.dwm
echo "#!/bin/bash" > ~/.dwm/autostart.sh
echo "/usr/bin/start-pulseaudio-x11 &" >> ~/.dwm/autostart.sh
echo "/usr/local/bin/slstatus &" >> ~/.dwm/autostart.sh
echo "/usr/bin/xcompmgr &" >> ~/.dwm/autostart.sh
echo "/usr/bin/redshift &" >> ~/.dwm/autostart.sh
echo "/usr/bin/thunderbird &" >> ~/.dwm/autostart.sh
echo "/usr/bin/spectacle -b -c -n &" >> ~/.dwm/autostart.sh
chmod +x ~/.dwm/autostart.sh

echo
echo "Please remember to set a fegbg with feh --bg-scale /path/to/wallpaper"
echo
echo "#/bin/bash" > ~/.dwm/autostart_blocking.sh
echo "~/.fehbg" >> ~/.dwm/autostart_blocking.sh
echo "export _JAVA_AWT_WM_NONREPARENTING=1" >> ~/.dwm/autostart_blocking.sh

cd ../st
curl -O https://st.suckless.org/patches/alpha/st-alpha-0.8.2.diff
git apply st-alpha-0.8.2.diff

cd ../dmenu
curl -O https://tools.suckless.org/dmenu/patches/case-insensitive/dmenu-caseinsensitive-20200523-db6093f.diff
git apply dmenu-caseinsensitive-20200523-db6093f.diff

echo ""
echo "Please remember to #include "shiftview.c" and"
echo "	{ MODKEY,              XK_i,           view_adjacent,  { .i = +1 } },"
echo "	{ MODKEY,              XK_u,           view_adjacent,  { .i = -1 } },"
echo "in your config.h, and/or copy config.def.h to config.h if `make` fails due to undefined variables"
