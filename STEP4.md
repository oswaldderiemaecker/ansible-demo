# Step 4

Steps:

* Adding Redis in Development Environment
* Install Redis Role from Ansible Galaxy
* Review Redis Playbook & Vars
* Deploy our Redis Playbook in the Developmment Environment

## Switch to branch step-4

```bash
git checkout step-4
```

## Getting Redis Role from Galaxy

```bash
ansible-galaxy install geerlingguy.redis geerlingguy.repo-epel
```

## Review Redis Playbook & Vars

Playbook:

```bash
cat redis.yml
```

Vars:

```bash
cat environments/development/groups_vars/main.yml
cat files/config.j2
```

## Inventory Listing

```bash
ansible --list-hosts --inventory environments/development/inventory development
```

## Web Server & Database Deployment

```bash
ansible-playbook --inventory environments/development/inventory redis.yml
ansible-playbook --inventory environments/development/inventory webserver.yml
```

Accessing the Webserver: http://webserver.dev.vagrant.local/

## Verify Apache running

```bash
ansible -i environments/development/inventory database -a 'systemctl is-active redis'
```

