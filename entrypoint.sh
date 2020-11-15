#!/bin/bash
apt-get update
apt-get purge -y openssh-server
apt-get install -y screen openssh-server pwgen netcat net-tools curl wget python
apt-get clean all
mkdir -p /run/sshd
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
echo "sshd: ALL" >> /etc/hosts.allow
echo "ALL: ALL: DENY" >> /etc/hosts.deny
mkdir -p /root/.ssh
cp /tmp/data/containers/webserver/id_rsa_ansible.pub /root/.ssh/authorized_keys
chmod 400 /root/.ssh/authorized_keys
/usr/sbin/sshd -D