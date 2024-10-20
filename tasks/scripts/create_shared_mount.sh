#!/usr/bin/env bash

sudo mkdir /sharedfs
sudo chown nobody.nogroup -R /sharedfs
sudo chmod 777 -R /sharedfs
sudo echo "node3:/sharedfs /sharedfs nfs default 0 0" >> /etc/fstab