
## Steps to run the private network of servers

- First download and install the vagrant: https://www.vagrantup.com/downloads.html

- Make sure you have already installed the virtual box. VMware did not work for me.

- Initialize create a directory multinet and initialize the vagrant: `vagrant init jasonc/centos07` OR `vagrant init hashicorp/bionic64`

- Modify the vagrant file as in this directory

- Add the hostnames in /etc/hosts for server01 and server02 as follows:

```
echo 10.9.8.11 server01 | sudo tee -a /etc/hosts
echo 10.9.8.12 server02 | sudo tee -a /etc/hosts
```

## generate the ssh key: `ssh-keygen` and `ssh-copy-id`:

```
ssh-keygen
ssh-copy-id server01
ssh-copy-id server02
```
# Start the VM and connect to `admin01` via ssh

``
vagrant up
vagrant ssh admin01
``

## Run the various commands and observe the output

```
./run_everywhere.sh servers
./run_everywhere.sh uptime
./run_everywhere.sh servers
./run_everywhere.sh -nsvf ext_file uptime
./run_everywhere.sh -svf ext_file uptime
...
...
```
