#!/usr/bin/env bash

echo "type=83" | sudo sfdisk  /dev/sda
sudo mkfs.ext4 /dev/sda1
sudo mkdir /sharedfs
sudo chown nobody.nogroup -R /sharedfs
sudo chmod 777 -R /sharedfs
sudo echo "/dev/sda1 /sharedfs ext4 defaults 0 2" >> /etc/fstab
sudo chown nobody.nogroup -R /sharedfs
sudo chmod 777 -R /sharedfs