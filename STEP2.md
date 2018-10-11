# Step 2

Steps:

* Review Staging Environment
* Ensure Disabling Display Errors
* Deploy our Staging Environment

## Switch to branch step-2

```bash
git checkout environments/development/groups_vars/main.yml
git checkout step-2
```

## Inventory Listing

```bash
ansible --list-hosts --inventory environments/staging/inventory staging
```

## Disabling Display Errors

```bash
vi environments/staging/groups_vars/main.yml
php_display_errors: "off"
```

## Web Server & Database Deployment

```bash
ansible-playbook --inventory environments/staging/inventory webserver.yml
ansible-playbook --inventory environments/staging/inventory database.yml
```

## Verify Apache running

```bash
ansible -i environments/staging/inventory webserver -a 'systemctl is-active httpd'
ansible -i environments/staging/inventory database -a 'systemctl is-active mariadb'
```

Accessing the Webserver: http://webserver.staging.vagrant.local/

Follow the [STEP3.md](STEP3.md)
