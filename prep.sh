#!/bin/bash

git checkout step-1
ansible-playbook --inventory environments/development/inventory webserver.yml
ansible-playbook --inventory environments/development/inventory database.yml
git checkout step-2
ansible-galaxy -r requirements.yml install
ansible-playbook --inventory environments/staging/inventory webserver.yml
ansible-playbook --inventory environments/staging/inventory database.yml
git checkout step-3
ansible-galaxy -r requirements.yml install
ansible-playbook --inventory environments/production/inventory webserver.yml
ansible-playbook --inventory environments/production/inventory database.yml
git checkout step-4
ansible-galaxy -r requirements.yml install
git checkout step-1
