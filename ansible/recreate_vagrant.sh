#!/usr/bin/env bash

vagrant destroy --force
vagrant up

ansible-playbook 100-vagrant.yml -i inventory/vagrant.yml
