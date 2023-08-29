# Django-CI-CD-NexusRegistery
This is my public repo for working/learning DevOps with Django CI/CD course from devopshobbies.

## Generate Treafik pass
```bash
echo $(htpasswd -nb user password) | sed -e s/\\$/\\$\\$/g
```
