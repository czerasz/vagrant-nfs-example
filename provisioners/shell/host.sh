#!/bin/bash

if [ $(dpkg-query -W -f='${Status}' nfs-kernel-server 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
    # Install the NFS server
    apt-get install -y nfs-kernel-server;


    # Create the directory which will be shared
    mkdir -p /var/nfs
    chown nobody:nogroup /var/nfs

    # Configure NFS exports
    echo '/home client.nfs(rw,sync,no_root_squash,no_subtree_check)' >> /etc/exports
    echo '/var/nfs client.nfs(rw,sync,no_subtree_check)' >> /etc/exports

    # sync - the data on the client is not cached in the memory buffer, it is written immediately to the host server so the host server has most up to date data.
    # async - is less "secure" but makes network traffic more efficient. This method allows for memory caching. Changes are cached in the memory buffer and flushed to the host server once it's full.
    # no_root_squash - if you have root access on your client machine you will also have root access on the host file system

    # Create the NFS table
    exportfs -a

    # Start the NFS server
    service nfs-kernel-server start
fi