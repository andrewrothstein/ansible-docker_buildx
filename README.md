andrewrothstein.docker_build
===========================
![Build Status](https://github.com/andrewrothstein/ansible-docker_buildx/actions/workflows/build.yml/badge.svg)

Installs the Docker [buildx](https://github.com/docker/buildx) cli plugin.

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
    - andrewrothstein.docker_buildx
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
