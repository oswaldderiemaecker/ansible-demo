# Step 3

Steps:

* Review Production Environment
* Deploy our Production Environment

## Switch to branch step-3

```bash
git checkout step-3
```

## Inventory Listing

```bash
ansible --list-hosts --inventory environments/production/inventory production
```

## Web Server & Database Deployment

```bash
ansible-playbook --inventory environments/production/inventory webserver.yml
ansible-playbook --inventory environments/production/inventory database.yml
```

Accessing the Webserver: http://webserver.production.vagrant.local/

## Verify Apache running

```bash
ansible -i environments/production/inventory webserver -a 'systemctl is-active httpd'
ansible -i environments/production/inventory database -a 'systemctl is-active mariadb'
```

Follow the [STEP4.md](STEP4.md)
