View mounted shares:

    df -h

Check existing NFS mounts:

    mount -t nfs

## Host Options

<table>
    <tbody>
        <tr>
            <td>sync</td>
            <td>the data on the client is not cached in the memory buffer, it is written immediately to the host server so the host server has most up to date data.</td>
        </tr>
        <tr>
            <td>async</td>
            <td>is less "secure" but makes network traffic more efficient. This method allows for memory caching. Changes are cached in the memory buffer and flushed to the host server once it's full.</td>
        </tr>
        <tr>
            <td>no_root_squash</td>
            <td>if you have root access on your client machine you will also have root access on the host file system</td>
        </tr>
        <tr>
            <td>nohide</td>
            <td></td>
        </tr>
    </tbody>
</table>

> **Note**
> <br/> `exportfs -rav` refreshes the NFS table after `/etc/exports` was changed.

## Client Options

<table>
    <tbody>
        <tr>
             <td>noexec</td>
             <td>-</td>
         </tr>
        <tr>
             <td>nosuid</td>
             <td>-</td>
         </tr>
        <tr>
             <td>nodev</td>
             <td>-</td>
         </tr>
        <tr>
             <td>noacl</td>
             <td>-</td>
         </tr>
        <tr>
             <td>nocto</td>
             <td>-</td>
         </tr>
        <tr>
             <td>noatime</td>
             <td>-</td>
         </tr>
        <tr>
             <td>nodiratime</td>
             <td>-</td>
         </tr>
        <tr>
             <td>nolock</td>
             <td>-</td>
         </tr>
        <tr>
             <td>hard</td>
             <td>-</td>
         </tr>
        <tr>
             <td>intr</td>
             <td>-</td>
         </tr>
    </tbody>
</table>

## Resources

- [Digital Ocean: How To Set Up an NFS Mount on Ubuntu 14.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nfs-mount-on-ubuntu-14-04)
- [How to configure an NFS server and mount NFS shares on Ubuntu 14.04](https://www.howtoforge.com/how-to-configure-a-nfs-server-and-mount-nfs-shares-on-ubuntu-14.04)
- [Youtube: The Network File System NFS](https://www.youtube.com/watch?v=vYj-zE8-1hU)
- [Linux NFS-HOWTO](http://nfs.sourceforge.net/nfs-howto/index.html)
- [NFS Server Performance and Tuning Guide for Sun Hardware](http://docs.oracle.com/cd/E19620-01/805-4448/index.html)
- [Managing NFS and NIS, 2nd Edition](http://docstore.mik.ua/orelly/networking_2ndEd/nfs/index.htm)
- [NixCraft: Tune NFS Performance](http://www.cyberciti.biz/faq/linux-unix-tuning-nfs-server-client-performance/)
- [Increase NFS Client Mount Point Security]()