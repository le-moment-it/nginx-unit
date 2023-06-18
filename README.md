Nginx-unit
===========

Description
-----------

This role installs and configure nginx unit

Dependencies
-----------
This role has no dependencies.

Requirements
-------------

### Ansible version

Minimum Ansible version : 2.1

### Platforms

This role will work on the following platforms :

Distribution | Version |
--- | --- |

Tasks tags
--------------

These tasks tags are available :

Role Variables
--------------

Variable | Type | Mandatory |  Example | File | Description
--- | --- | --- | --- | --- | --- |


Default Variables
------------------

Variable | Value | Description | Type | File
--- | --- | --- | --- | --- |
``nginx_unit_gpg_key_url`` | https://unit.nginx.org/keys/nginx-keyring.gpg  | Nginx unit GPG key | string  | main.yml
``nginx_unit_gpg_key_destination`` | /usr/share/keyrings/nginx-keyring.gpg  | Nginx unit GPG folder | string | main.yml
``nginx_unit_apt_sources`` |  [value](defaults/main.yml)  | Nginx unit sources | list | main.yml
``nginx_unit_install`` | []  | List of units to install | list | main.yml
``nginx_unit_configuration`` | None  | Configuration in json format | string | main.yml
``nginx_state_directory`` | /var/lib/unit  | Nginx unit state directory | string | main.yml
``nginx_unit_cerbot_challenge_directory`` | /certbot_challenge  | Certbot challenge folder, used to better manage certificates creation | string | main.yml
``nginx_unit_certbot_certificates`` | []  | Certificates to create, check example | string | main.yml
``nginx_unit_certbot_certificates_folder`` | /etc/letsencrypt/live/  | Default certbot folder | string | main.yml
``nginx_unit_certbot_email_address`` | example@example.com  | Email to register certificates | string | main.yml
``nginx_unit_applications_directory`` | []  | n/a | n/a | 
``nginx_certbot_unit_configuration`` |  [value](defaults/)  | n/a | n/a | 

Molecule scenario
------------------

### Ec2
Scenario | Platform name | Image name | Instance type |
--- | --- | --- | --- | 
``default`` | instance |  | 




Author
-------

Le Moment IT