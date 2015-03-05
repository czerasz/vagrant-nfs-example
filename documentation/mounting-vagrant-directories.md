# Mounting Vagrant directories on Host

## SSHFS

Install SSHFS client on Ubuntu:

    apt-get install sshfs

Mounting the Remote File System

    mkdir /mnt/vagrant

    sshfs -o IdentityFile=~/.ssh/id_rsa root@xxx.xxx.xxx.xxx:/home/vagrant/shared /mnt/vagrant

Unmounting 

    umount /mnt/vagrant

Permanent Mount

    echo -n "\nsshfs#root@xxx.xxx.xxx.xxx:/ /mnt/vagrant\n" >> /etc/fstab


### Resources:

- [Digital Ocean: Mount Remote File Systems with SSHFS](https://www.digitalocean.com/community/tutorials/how-to-use-sshfs-to-mount-remote-file-systems-over-ssh)
- [How To Set Up an NFS Mount on Ubuntu 14.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nfs-mount-on-ubuntu-14-04)

## NFS

Client - home computer
Host - Vagrant VM

Install NFS on vagrant host - allows to share directories

    apt-get update # Refresh local package index
    apt-get install nfs-kernel-server

Install on client

    apt-get update
    apt-get install nfs-common

Configure Host:

- create directory which will be mounted

        mkdir /var/nfs
        chown nobody:nogroup /var/nfs
    
- Configure NFS exports
  
        echo '/var/nfs client.nfs(rw,sync,no_subtree_check)' >> /etc/exports
    
- Create the NFS table
  
        exportfs -a
    
- Start the NFS server

        service nfs-kernel-server start

Configure Client:

- Create mount directories

        mkdir -p /mnt/nfs/var/nfs
    
- Mount shares to directories

        mount host.nfs:/var/nfs /mnt/nfs/var/nfs

View mounted NFS shares

    mount -t nfs

### Resources:

- [Digital Ocean: How To Set Up an NFS Mount on Ubuntu 14.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nfs-mount-on-ubuntu-14-04)
- [How to configure an NFS server and mount NFS shares on Ubuntu 14.04](https://www.howtoforge.com/how-to-configure-a-nfs-server-and-mount-nfs-shares-on-ubuntu-14.04)