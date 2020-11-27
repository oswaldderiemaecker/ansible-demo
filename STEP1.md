# Step 1

Steps: 

* Install Galaxy Roles for Apache, PHP and MySQL
* Review Development Environment
* Review Web Server & Database Playbook
* Deploy our Development Environment
* Modify the Display Error attribute for Development
* ReDeploy our Development Environment

## Switch to branch step-1

```bash
git checkout step-1
```

## Install Galaxy Roles

Via [Ansible Galaxy](https://galaxy.ansible.com/home)

```bash
ansible-galaxy install geerlingguy.apache geerlingguy.php geerlingguy.mysql -f
```

or

```bash
ansible-galaxy install -r requirements.yml
```

## Inventory Listing

```bash
ansible --list-hosts --inventory environments/development/inventory development
```

## Web Server & Database Deployment

```bash
ansible-playbook --inventory environments/development/inventory webserver.yml
ansible-playbook --inventory environments/development/inventory database.yml
```

## Verify Apache running

```bash
ansible -i environments/development/inventory webserver -a 'systemctl is-active httpd'
ansible -i environments/development/inventory database -a 'systemctl is-active mariadb'
```

Accessing the Webserver: http://webserver.dev.vagrant.local/

## Enabling Display Errors

```bash
vi environments/development/groups_vars/main.yml
php_display_errors: "on"
```

```bash
ansible-playbook --inventory environments/development/inventory webserver.yml
```

Follow the [STEP2.md](STEP2.md)
