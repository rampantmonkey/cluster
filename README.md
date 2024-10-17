# cluster

Notes and playbook for running my compute cluster(s).

Currently focused on experimenting with different workload schedulers on my Turing Pi board.


## Setting up the cluster
First, install Ubuntu on each node in the cluster using the BMC.

Then create an ansible user with the correct ssh key for accessing the node. Below is the sequence of commands I ran on each node to bootstrap the cluster.

```
ubuntu@node1:~$ sudo su
root@node1:/home/ubuntu# useradd -rm ansible
root@node1:/home/ubuntu# echo "ansible ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible
root@node1:/home/ubuntu# chmod 440 /etc/sudoers.d/ansible
root@node1:/home/ubuntu# mkdir -m 700 /home/ansible/.ssh
root@node1:/home/ubuntu# echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO7kqBPUpVpPS4pTJXk5zQu2FMLZkNda2Q521btGCRDI" > /home/ansible/.ssh/authorized_keys
root@node1:/home/ubuntu# chmod 600 /home/ansible/.ssh/authorized_keys
root@node1:/home/ubuntu# chown -R ansible.ansible /home/ansible/.ssh
root@node1:/home/ubuntu# exit
exit
```

Finally, disable root login and password login for the ssh daemon.


## Getting Started

1. Create a new virtual environment for installing python packages (like ansible). This only needs to be done the first time setting up this repository on a computer. `python3 -m venv venv`
2. Activate virtual environment. `source venv/bin/activate`
3. Install dependencies. `pip install -r requirements.txt`