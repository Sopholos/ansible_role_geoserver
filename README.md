Fork of https://code-repo.d4science.org/InfraScience/ansible-role-geoserver

Role Name
=========

A role that 

Role Variables
--------------

The most important variables are listed below:

``` yaml
users_system_users:
  - { login: 'foo', name: "Foo Bar", home: '{{ users_home_dir }}', createhome: 'yes', ssh_key: '{{ foo_ssh_key }}', shell: '/bin/bash', admin: False, log_as_root: False }
```

Dependencies
------------

None

License
-------

EUPL-1.2

Author Information
------------------

Andrea Dell'Amico, <andrea.dellamico@isti.cnr.it>
