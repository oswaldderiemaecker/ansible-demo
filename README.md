# Ansible Lamp Stack in Multiple environments

You have 2 ways to generate your inventories with

    - Docker
    - Vagrant

## Install Docker

```
https://docs.docker.com/get-docker/
```

## Generating Private & Public Key

```bash
$ ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa_ansible -q -N ""
$ cd ../
$ mkdir docker-ansible-env (for example)
$ cd /ansible-demo
$ mv id_rsa_ansible.pub containers/webserver
$ mv id_rsa_ansible.pub ../docker-ansible-env
```
** Be sure that in your ssh.config your IdentityFile is set to "../docker-ansible-env/id_rsa_ansible" **

## Up you host containers hosts

```bash
$ docker-compose up -d

Creating network "ansible-demo_default" with the default driver
Creating ansible-demo_webserver-dev_1     ... done
Creating ansible-demo_database-staging_1  ... done
Creating ansible-demo_webserver-staging_1 ... done
Creating ansible-demo_database-dev_1      ... done
Creating ansible-demo_webserver-prod_1    ... done
Creating ansible-demo_database-prod_1     ... done
```

## Check that all Hosts Container Machine are up and running
# **Wait a few seconds until all databases container finished their entrypoint and runs the ssh agent !**

```
$ docker-compose ps
              Name                         Command           State               Ports             
---------------------------------------------------------------------------------------------------
ansible-demo_database-dev_1        /tmp/data/entrypoint.sh   Up      0.0.0.0:2225->22/tcp, 5432/tcp
ansible-demo_database-prod_1       /tmp/data/entrypoint.sh   Up      0.0.0.0:2229->22/tcp, 5432/tcp
ansible-demo_database-staging_1    /tmp/data/entrypoint.sh   Up      0.0.0.0:2227->22/tcp, 5432/tcp
ansible-demo_webserver-dev_1       /usr/sbin/sshd -D         Up      0.0.0.0:2224->22/tcp          
ansible-demo_webserver-prod_1      /usr/sbin/sshd -D         Up      0.0.0.0:2228->22/tcp          
ansible-demo_webserver-staging_1   /usr/sbin/sshd -D         Up      0.0.0.0:2226->22/tcp          
```

## Check that Ansible can reach its hosts
```
$ ansible database.dev.local -m ping

database.dev.local | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    }, 
    "changed": false, 
    "ping": "pong"
}

$ ansible webserver.staging.local -m ping

webserver.staging.local | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    }, 
    "changed": false, 
    "ping": "pong"
}
```

## *If you see thee kind of logs in your databases container you're good to continue* :
```
$ docker-compose logs -f database.staging.local
                            ...
database-dev_1       | Setting up python2 (2.7.16-1) ...
database-dev_1       | Setting up libpython-stdlib:amd64 (2.7.16-1) ...
database-dev_1       | Setting up xauth (1:1.0.10-1) ...
database-dev_1       | Setting up libcurl4:amd64 (7.64.0-4+deb10u1) ...
database-dev_1       | Setting up curl (7.64.0-4+deb10u1) ...
database-dev_1       | Setting up python (2.7.16-1) ...
database-dev_1       | Processing triggers for systemd (241-7~deb10u4) ...
database-dev_1       | Processing triggers for libc-bin (2.28-10) ...
database-dev_1       | Processing triggers for ca-certificates (20200601~deb10u1) ...
database-dev_1       | Updating certificates in /etc/ssl/certs...
database-dev_1       | 0 added, 0 removed; done.
database-dev_1       | Running hooks in /etc/ca-certificates/update.d...
database-dev_1       | done.
```

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
