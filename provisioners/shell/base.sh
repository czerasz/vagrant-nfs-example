#!/bin/bash

# For NFS it's HIGHLY recommended to use a time sync daemon on ALL nodes to keep client/server clocks in sync

# Set the right timezone
if [ ! -f /etc/localtime.bak ]; then
    mv /etc/localtime /etc/localtime.bak
    ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

    mv /etc/timezone /etc/timezone.bak
    echo 'Europe/Berlin' > /etc/timezone 
fi

# Install NTP to keep the time synced
apt-get install -y ntp

# Resource: http://www.wikihow.com/Change-the-Timezone-in-Linux