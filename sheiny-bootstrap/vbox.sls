{% from 'sheiny-bootstrap/map.jinja' import bootstrap %}

{% if grains['os_family'] == 'RedHat' %}

Install repo:
  file.managed:
    - name: /etc/yum.repos.d/virtualbox.repo
    - source: salt://sheiny-bootstrap/files/virtualbox.repo

Install VirtualBox packages:
  pkg.installed:
    - pkgs:
      - dkms
      - VirtualBox-{{ bootstrap.vbox_version }}
      - vagrant
    - refresh: True

{% endif %}
