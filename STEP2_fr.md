# Étape 2

Étapes:

* Examiner de l'environnement de Pré-Production (Staging)
* Assurez-vous de désactiver l'affichage des erreurs (php_display_errors) en Pré-production
* Déployer notre environnement de Pré-Production (Staging)

## Passer à la branche step-2

```bash
git checkout environments/development/groups_vars/main.yml
git checkout step-2
```

## Liste d'inventaire

```bash
cat environments/staging/inventory
ansible --list-hosts --inventory environments/staging/inventory staging
```
##  Désactivation l'affichage des erreurs et configuration base de donnée pour notre application

```bash
cat environments/staging/groups_vars/main.yml
php_display_errors: "off"
database_host: "database.staging.vagrant.local"
```

## Déploiement du serveur Web et de base de données

```bash
ansible-playbook --inventory environments/staging/inventory webserver.yml
ansible-playbook --inventory environments/staging/inventory database.yml
```

## Vérifier Apache et Mariadb sont en cours d'exécution

```bash
ansible -i environments/staging/inventory webserver -a 'systemctl is-active httpd'
ansible -i environments/staging/inventory database -a 'systemctl is-active mariadb'
```

Accès au serveur Web: http://webserver.staging.vagrant.local/

Suite [STEP3_fr.md](STEP3_fr.md)
