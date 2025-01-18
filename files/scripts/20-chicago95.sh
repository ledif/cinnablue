#!/usr/bin/env bash

set -xueo pipefail

# Fetch
cd /tmp
wget https://github.com/grassmunk/Chicago95/archive/31a357c.zip
unzip -q *.zip
mv Chicago95* /usr/src/chicago95
cd /usr/src/chicago95

# Themes
cp -r Theme/Chicago95 /usr/share/themes
#flatpak override --filesystem=/usr/share/blue95/themes/
#flatpak override --env=GTK_THEME=Chicago95

# Icons and cursors
cp -r Icons/* Cursors/* /usr/share/icons/

# Battery tweaks (stay on full icon from 100%-90%)
for f in $(find . -name "battery-level-90*"); do
  target=$(echo ${f/90/100} | sed 's/-charging//')
  rm $f
  ln -s $target $f
done


# Custom app icons

ln -s /usr/share/icons/Chicago95/apps/48/{software,bauh}.png
ln -s /usr/share/icons/Chicago95/apps/48/stock_keyring.png /usr/share/icons/Chicago95/apps/com.onepassword.OnePassword.png

update-mime-database /usr/share/mime
gdk-pixbuf-query-loaders-64 --update-cache


# Fonts
cp Fonts/vga_font/LessPerfectDOSVGA.ttf /usr/share/fonts
cp -r Fonts/bitmap/cronyx-cyrillic /usr/share/fonts
fc-cache -fv

# Use Qt instead of GTK if possible
mkdir -p /usr/share/qt5ct/colors
cp Extras/Chicago95_qt.conf /usr/share/qt5ct/colors

# Terminal
mkdir -p /etc/skel/.local/share/xfce4/terminal/colorschemes
cp Extras/Chicago95.theme /etc/skel/.local/share/xfce4/terminal/colorschemes

# Sounds
cp -Rf sounds/Chicago95 /usr/share/sounds/
cp -f "Extras/Microsoft Windows 95 Startup Sound.ogg" /usr/share/sounds/Chicago95/startup.ogg

cp -f ./sounds/chicago95-startup.desktop /etc/skel/.config/autostart

# Backgrounds
cp -Rf ./Extras/Backgrounds /usr/share/backgrounds/Chicago95


# Plymouth
cp -Rf Plymouth/Chicago95 /usr/share/plymouth/themes/
plymouth-set-default-theme Chicago95
