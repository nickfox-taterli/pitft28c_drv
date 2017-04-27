#/bin/sh

echo "Install TFT28 Driver ... [Please wait]"

sudo apt-get update -qq
sudo apt-get install -y -qq xinput-calibrator xserver-xorg-input-evdev
sudo tar xf pack.tar.bz2 -C /
sudo mv /usr/share/X11/xorg.conf.d/10-evdev.conf /usr/share/X11/xorg.conf.d/45-evdev.conf

echo "Install OK!"
