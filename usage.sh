#!/bin/sh
# https://github.com/lwfinger/rtl8723bu

# maybe perform the 'make'  commands from readme?
make
sudo make install
sudo modprobe -v 8723bu

apt install dkms -y
source dkms.conf
sudo mkdir /usr/src/$PACKAGE_NAME-$PACKAGE_VERSION
sudo cp -r core hal include os_dep platform dkms.conf Makefile rtl8723b_fw.bin /usr/src/$PACKAGE_NAME-$PACKAGE_VERSION
sudo dkms add -m $PACKAGE_NAME/$PACKAGE_VERSION # anders dan op github staat!
sudo dkms autoinstall $PACKAGE_NAME/$PACKAGE_VERSION
sudo echo 'blacklist rtl8xxxu' >> /etc/modprobe.d/blacklist.conf  # staat ook niet op github, wel nodig anders laadt hij oude driver

