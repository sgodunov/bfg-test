# bfg-test
---
## provision
##### Requirements:
* docker >= 17.0

Shell script provisions docker container on localhost

##### Usage
To create docker image and start container:
```
$ ./provision.sh start
```
To stop container:
```
$ ./provision.sh stop
```
To stop container and delete image:
```
$ ./provision.sh destroy
```

----
## ansible
##### Requirements:
* ansible >= 2.0

Ansible playbook initialize required services for stack_over_search project. Password for ansible-vault: bfg-test

##### Usage
```
$ ansible-playbook playbook.yml --ask-vault-pass
```
Ansible vault password: `bfg-test`

----
After starting container and running playbook you should be able to see project page at http://localhost
App, nginx, mysql logs can be found in subdirs of docker's */var/log*
Due to test nature of a project private key have been pushed to repository.
