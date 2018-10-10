* Review Staging Environement
* Disabling Display Errors
* Deploy our Staging Environement

# Inventory Listing

```bash
ansible --list-hosts --inventory environments/staging/inventory staging
```

# Disabling Display Errors

```bash
vi environments/development/groups_vars/main.yml
php_display_errors: "on"
```

# Web Server & Database Deployment

```bash
ansible-playbook --inventory environments/staging/inventory webserver.yml
ansible-playbook --inventory environments/staging/inventory database.yml
```

# Verify Apache running

```bash
ansible -i environments/staging/inventory webserver -a 'systemctl is-active httpd'
```

Accessing the Webserver: http://webserver.staging.vagrant.local/

