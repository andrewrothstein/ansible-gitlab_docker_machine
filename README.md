andrewrothstein.gitlab_docker_machine
===========================
![Build Status](https://github.com/andrewrothstein/ansible-gitlab_docker_machine/actions/workflows/build.yml/badge.svg)

Installs [gitlab_docker_machine](https://github.com/docker/machine)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.gitlab_docker_machine
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
