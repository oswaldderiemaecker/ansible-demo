* Review Production Environement
* Review Web Server Playbook
* Deploy our Production Environement

# Inventory Listing

```bash
ansible --list-hosts --inventory environments/production/inventory staging
```

# Web Server & Database Deployment

```bash
ansible-playbook --inventory environments/production/inventory webserver.yml
ansible-playbook --inventory environments/production/inventory database.yml
```

Accessing the Webserver: http://webserver.production.vagrant.local/

# Verify Apache running

```bash
ansible -i environments/production/inventory webserver -a 'systemctl is-active httpd'
```
