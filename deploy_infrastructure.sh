#!/bin/bash
echo $PWD

# Configuring CAN and virtual CAN interface to set up automatically:
sudo echo "
can
can_raw
vcan
" >> /etc/modules-load.d/can.conf

systemctl start systemd-networkd
systemctl enable systemd-networkd

sudo echo "
[NetDev]
Name=vcan0
Kind=vcan
MTUBytes=8
Description=Virtual CAN0 network interface
" >> /etc/systemd/network/vcan0.netdev

sudo echo "
[Match]
Name=vcan0
" >> /etc/systemd/network/80-vcan.network

./create_aderc.sh

rm $HOME/cyphalhome/.adehome
touch $HOME/cyphalhome/.adehome

# Cloning repositories:
cd $HOME/cyphalhome

if [ -d "$HOME/cyphalhome/BRTCyphal" ]; then
    echo "BRTCyphal already exists."
    cd BRTCyphal
    git pull
else
    git clone git@github.com:Bauman-Racing-Team/BRTCyphal.git
    cd BRTCyphal
fi

git submodule update --init --recursive

echo "To start the virtual can bus, restart the computer now (It is required only once)."