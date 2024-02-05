#!/bin/bash
echo $PWD

# Configuring CAN and virtual CAN interface to set up automatically:
echo "
can
can_raw
vcan
" >> /etc/modules-load.d/can.conf

systemctl start systemd-networkd
systemctl enable systemd-networkd

echo "
[NetDev]
Name=vcan0
Kind=vcan
MTUBytes=8
Description=Virtual CAN0 network interface
" >> /etc/systemd/network/vcan0.netdev

echo "
[Match]
Name=vcan0
" >> /etc/systemd/network/80-vcan.network

# Cloning repositories:
mkdir -p $HOME/BRT/gitwork/

cd $HOME/BRT/gitwork/

if [ -d "$HOME/BRT/gitwork/BRTCyphal" ]; then
    echo "BRTCyphal already exists."
    cd BRTCyphal
    git pull
else
    git git@github.com:Bauman-Racing-Team/BRTCyphal.git
    cd BRTCyphal
fi

git submodule update --init --recursive

echo "To start the virtual can bus, restart the computer now (It is required only once)."

echo "Then you can run the cyphal container using the commands below:
      docker-compose run cyphal bash"
