{% from 'sheiny-bootstrap/map.jinja' import bootstrap %}

{% if grains['os_family'] == 'RedHat' %}

#Install Vagrant:
#
# Download RPM, verify hash, and install
# 


Install repo:
  file.managed:
    - name: /etc/yum.repos.d/virtualbox.repo
    - source: salt://sheiny-bootstrap/files/virtualbox.repo

Install VirtualBox packages:
  pkg.installed:
    - pkgs:
      - kernel-devel
      - dkms
      - VirtualBox-{{ bootstrap.vbox_version }}
      #- vagrant
    - refresh: True
    - requires:
      - pkg: 

{% endif %}
