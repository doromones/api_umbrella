#!/usr/bin/env bash

cd "$(dirname "$0")" || exit

vagrant destroy --force
vagrant up

echo "\n***********"
echo "Sleep 30 seconds"
echo "***********\n"
sleep 30

ansible-playbook 100-vagrant.yml -i inventory/vagrant.yml
