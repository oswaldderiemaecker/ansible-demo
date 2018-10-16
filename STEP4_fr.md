# Étape 4

Étapes:

* Ajouter Redis dans l'environnement de développement
* Installer Redis à partir d'Ansible Galaxy
* Examiner le playbook Redis et ses variables
* Déployer notre playbook Redis dans l'environnement de développement

## Passer à la branche step-4

```bash
git checkout step-4
```

## Installer le rôle Redis de Galaxy

```bash
ansible-galaxy install geerlingguy.redis geerlingguy.repo-epel
```

ou

```bash
cat requirements.yml
ansible-galaxy -r requirements.yml install
```

## Examiner le playbook Redis et ses variables

Playbook:

```bash
cat redis.yml
```

Vars:

```bash
cat environments/development/groups_vars/main.yml
cat files/config.j2
```

## Liste d'inventaire

```bash
ansible --list-hosts --inventory environments/development/inventory development
```

## Déploiement de redis et du serveur Web

```bash
ansible-playbook --inventory environments/development/inventory redis.yml
ansible-playbook --inventory environments/development/inventory webserver.yml
```

## Vérifier que Redis est en cours d'exécution


```bash
ansible -i environments/development/inventory database -a 'systemctl is-active redis'
```

Accéder au serveur Web: http://webserver.dev.vagrant.local/
