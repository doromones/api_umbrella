#!/usr/bin/env bash

cd "$(dirname "$0")" || exit

vagrant destroy --force
vagrant up

echo "\n***********"
echo "Sleep 5 seconds"
echo "\n***********"
sleep 5

ansible-playbook 100-vagrant.yml -i inventory/vagrant.yml
