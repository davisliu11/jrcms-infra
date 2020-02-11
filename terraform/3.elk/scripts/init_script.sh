#!/bin/bash
set -e

apt update

apt install -y ansible

ansible-galaxy install geerlingguy.docker
ansible-galaxy install geerlingguy.pip

git clone https://github.com/davisliu11/jrcms-infra.git /jrcms-infra

SCRIPTS=/jrcms-infra/terraform/3.elk/scripts/
ln -s $SCRIPTS /scripts

ANSIBLE_PLAYBOOK=$SCRIPTS/site.yaml
ansible-playbook $ANSIBLE_PLAYBOOK