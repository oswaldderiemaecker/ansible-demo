# Étape 1

Étapes:

* Installer Galaxy Roles pour Apache, PHP et MySQL
* Examiner l'environnement de développement
* Examiner le playbook du serveur Web et de la base de données
* Déployer notre environnement de développement
* Modifier l'attribut php_display_errors pour le développement
* Redéployer notre environnement de développement

## Passer à la branche step-1

```bash
git checkout step-1
```

## Installer les rôles de Galaxy

Via [Ansible Galaxy](https://galaxy.ansible.com/home)

```bash
ansible-galaxy install geerlingguy.apache geerlingguy.php geerlingguy.mysql -f
```

ou

```bash
cat requirements.yml
ansible-galaxy -r requirements.yml install
```

## Notre Fichier config Ansible

```bash
cat ansible.cfg
```

## Liste d'inventaire

```bash
cat environments/development/inventory
ansible --list-hosts --inventory environments/development/inventory development
```

### Notre environment de développement

```bash
cat environments/development/groups_vars/main.yml
cat files/index.php
cat files/config.j2
cat tasks/load-vars.yml
cat webserver.yml
cat database.yml
```

## Déploiement du serveur Web et de base de données

```bash
ansible-playbook --inventory environments/development/inventory webserver.yml
ansible-playbook --inventory environments/development/inventory database.yml
```

## Vérifier Apache et Maradb sont bien en cours d'exécution

```bash
ansible -i environments/development/inventory webserver -a 'systemctl is-active httpd'
ansible -i environments/development/inventory database -a 'systemctl is-active mariadb'
```

Accessing the Webserver: http://webserver.dev.vagrant.local/

# Activer l'affichage des erreurs en développement

```bash
vi environments/development/groups_vars/main.yml
php_display_errors: "on"
```

```bash
ansible-playbook --inventory environments/development/inventory webserver.yml
```

Suite [STEP2_fr.md](STEP2_fr.md)
