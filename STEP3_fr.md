# Étape 3

Étapes:

* Examiner l'environnement de production
* Déployer notre environnement de production

## Passer à la branche step-3

```bash
git checkout step-3
```

## Liste d'inventaire

```bash
cat environments/production/inventory
ansible --list-hosts --inventory environments/production/inventory production
```

##  Désactivation l'affichage des erreurs et configuration base de donnée pour notre application

```bash
cat environments/production/groups_vars/main.yml
php_display_errors: "off"
database_host: "database.production.vagrant.local"
```

## Déploiement de serveurs Web et de bases de données

```bash
ansible-playbook --inventory environments/production/inventory webserver.yml
ansible-playbook --inventory environments/production/inventory database.yml
```

## Vérifier Apache et Mariadb sont en cours d'exécution

```bash
ansible -i environments/production/inventory webserver -a 'systemctl is-active httpd'
ansible -i environments/production/inventory database -a 'systemctl is-active mariadb'
```

Accès au serveur Web: http://webserver.production.vagrant.local/

Suite [STEP4_fr.md](STEP4_fr.md)
