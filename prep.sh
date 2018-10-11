#!/bin/bash

git checkout step-2
ansible-galaxy -r requirements.yml install
ansible-playbook --inventory environments/staging/inventory webserver.yml
ansible-playbook --inventory environments/staging/inventory database.yml
git checkout step-3
ansible-galaxy -r requirements.yml install
ansible-playbook --inventory environments/production/inventory webserver.yml
ansible-playbook --inventory environments/production/inventory database.yml
git checkout step-1
