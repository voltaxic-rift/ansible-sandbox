#!/bin/bash

set -xeu

cp /vagrant/ssh/* /home/vagrant/.ssh/
chown -R vagrant:vagrant /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
chmod 600 /home/vagrant/.ssh/id_rsa

cat - << EOS >> /etc/hosts
172.30.0.10 ansible
172.30.0.11 node1
172.30.0.12 node2
EOS

yum install -y epel-release
yum install -y ansible