# Ansible Lamp Stack in Multiple environments

## Install Vagrant and it's Plugins

```bash
vagrant plugin install vagrant-hostmanager # (1.8.9, global)
vagrant plugin install vagrant-vbguest # (0.16.0, global)
```

## Generating Private & Public Key

```bash
ssh-keygen -b 2048 -t rsa -f ~/.ssh/vagrant-key_rsa -q -N ""
```

## Install Vagrant Machines

```bash
vagrant up
```

## All Machines ready

```bash
vagrant status
```

## Snapshot the Machines

```bash
vagrant snapshot save ansible_workstation
vagrant snapshot save webserver_dev
vagrant snapshot save database_dev
vagrant snapshot save webserver_staging
vagrant snapshot save database_staging
vagrant snapshot save webserver_production
vagrant snapshot save database_production
```

```bash
vagrant snapshot list
vagrant snapshot restore ansible_workstation ansible_workstation
```

## Checkout the Demo Steps

```bash
git checkout step-1
```

Follow the [STEP1.md](STEP1.md) and follow steps md files
