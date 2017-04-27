#/bin/sh

echo "Install TFT28 Driver ... [Please wait]"

sudo apt-get update -qq
sudo apt-get install -y -qq xinput-calibrator xserver-xorg-input-evdev
sudo tar xf pack.tar.bz2 -C /
sudo mv /usr/share/X11/xorg.conf.d/10-evdev.conf /usr/share/X11/xorg.conf.d/45-evdev.conf
sudo sed -i 's/rootwait/rootwait fbcon=map:10 fbcon=font:VGA8x8 consoleblank=0/g' "/boot/cmdline.txt"

if [ -d "/home/pi/RetroPie-Setup" ]; then
 echo "Setting up RetroPie!... [Please wait]" 
 sudo apt-get install -y -qq cmake
 git clone https://github.com/tasanakorn/rpi-fbcp
 cd rpi-fbcp/
 mkdir build
 cd build/
 cmake ..
 make
 sudo install fbcp /usr/local/bin/fbcp
 sudo sed -i "/exit 0/i\/usr/local/bin/fbcp &" /etc/rc.local
fi

echo "Install OK!Now rebooting... [Please wait]" 

sudo sync
sudo reboot
