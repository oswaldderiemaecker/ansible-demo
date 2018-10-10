# Ansible Lamp Stack in Multiple environment 

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

## Checkout the Demo Steps

```bash
git checkout step-1
```

Follow the [STEP1.md](STEP1.md) and follow steps md files
