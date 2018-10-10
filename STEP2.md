* Review Staging Environement
* Review Web Server Playbook
* Deploy our Staging Environement

# Inventory Listing

```bash
ansible --list-hosts --inventory environments/staging/inventory staging
```

# Web Server & Database Deployment

```bash
ansible-playbook --inventory environments/staging/inventory webserver.yml
ansible-playbook --inventory environments/staging/inventory database.yml
```

Accessing the Webserver: http://webserver.staging.vagrant.local/

# Verify Apache running

```bash
ansible -i environments/staging/inventory webserver -a 'systemctl is-active httpd'
```
