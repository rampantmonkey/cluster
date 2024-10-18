#!/usr/bin/env bash

sudo lsblk -io NAME,TYPE,SIZE,MOUNTPOINT,FSTYPE,MODEL
sudo pvcreate /dev/nvme0n1
sudo vgcreate vgnfs /dev/nvme0n1
sudo vgs -v
sudo lvcreate -l 100%VG -n lvnfs vgnfs
sudo lvdisplay
sudo mkfs.ext4 /dev/vgnfs/lvnfs
sudo mkdir -p /mnt/bulk
sudo mount /dev/vgnfs/lvnfs /mnt/bulk
sudo df -H

sudo echo "/dev/mapper/vgnfs-lvnfs /mnt/bulk ext4 defaults 0 0" >> /etc/fstab