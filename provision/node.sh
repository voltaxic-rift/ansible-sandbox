#!/bin/bash

set -xeu

cat /vagrant/ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

cat - << EOS >> /etc/hosts
172.30.0.10 ansible
172.30.0.11 node1
172.30.0.12 node2
EOS