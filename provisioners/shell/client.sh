#!/bin/bash

# Install the NFS client package
if [ $(dpkg-query -W -f='${Status}' nfs-common 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    apt-get install -y nfs-common;
fi

# Create mount directories
mkdir -p /mnt/nfs/home
mkdir -p /mnt/nfs/var/nfs

# Mount shares to directories
mount host.nfs:/home /mnt/nfs/home
mount host.nfs:/var/nfs /mnt/nfs/var/nfs

# Unmout shares with
# umount /mnt/nfs/home
# umount /mnt/nfs/var/nfs

echo -n "# Mounting NFS shares:\n"
echo 'host.nfs:/home      /mnt/nfs/home   nfs auto,noexec,nosuid,nodev,noacl,nocto,noatime,nodiratime,nolock,bg,nfsvers=4,hard,intr,tcp,actimeo=1800 0 0' >> /etc/fstab
echo -n "\n" >> /etc/fstab
echo 'host.nfs:/var/nfs   /mnt/nfs/var/nfs   nfs  auto,noexec,nosuid,nodev,noacl,nocto,noatime,nodiratime,nolock,bg,nfsvers=4,sec=krb5p,hard,intr,tcp,actimeo=1800 0 0' >> /etc/fstab
echo -n "\n" >> /etc/fstab