# Example

This is an example of how to use this ansible role (coming from the last molecule test with `./configuration.json` ) :

```
---
- name: Converge
  hosts: all
  tasks:
    - name: Set variables 
      ansible.builtin.set_fact:
        configuration: "{{ lookup('env', 'MOLECULE_SCENARIO_DIRECTORY') }}/configuration.json"
      tags:
        - certificate

    - name: "Include nginx-unit"
      ansible.builtin.include_role:
        name: "nginx-unit"
      tags:
        - certificate
  vars:
    - nginx_unit_applications_directory:
      - /www/data/prod
    - nginx_unit_install:
      - unit-python3.9
    - nginx_unit_configuration: "{{ lookup('file', configuration) }}"
    - nginx_unit_certbot_email_address: le_moment_it@proton.me
    - nginx_unit_certbot_certificates:
        - unit.stream.vasseurlaurent.com:
            subject_alternative_names: []
            listener: "*:443" 
```