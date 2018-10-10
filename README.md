# Lamp Stack from Ansible Galaxy

## Generating Private & Public Key

```bash
ssh-keygen -b 2048 -t rsa -f ~/.ssh/vagrant-key_rsa -q -N ""
```

## Install Vagrant Machines

```bash
vagrant up
```

## Connecting to the Ansible Workstation

```bash
vagrant ssh ansible_workstation
```

## Install Roles

```bash
ansible-galaxy install geerlingguy.apache geerlingguy.php geerlingguy.mysql
```

## Getting Inventory Hosts

```bash
ansible webserver --list-hosts
ansible database --list-hosts
ansible --list-hosts --inventory environments/development/inventory development
```

## Deploying our environments

### Installing and Configuring the Webserver in Developement

```bash
ansible-playbook --inventory environments/development/inventory webserver.yml
```

Accessing the Webserver: http://webserver.dev.vagrant.local/

### Installing and Configuring the Webserver in Staging

```bash
ansible-playbook --inventory environments/staging/inventory webserver.yml
```
Accessing the Webserver: http://webserver.staging.vagrant.local/

## Health and Checks
### Ping our hosts

```bash
ansible webserver -m ping
ansible -i environments/development/inventory webserver -m ping
```

### Check Service state

```bash
ansible -i environments/development/inventory webserver -a 'systemctl is-active redis'
```

### Checking Syntax

```bash
ansible-playbook --syntax-check webserver.yml
```

### Getting informations about a host

```bash
ansible -i environments/development/inventory webserver -m setup
```
