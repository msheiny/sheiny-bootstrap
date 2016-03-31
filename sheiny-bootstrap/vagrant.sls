{% from 'sheiny-bootstrap/map.jinja' import bootstrap as bs %}
{% set arch =  salt['grains.get']('osarch', 'x86_64') %}
{% set vrpm = "vagrant_"+bs.vagrant.ver+"_"+arch+".rpm" %}

{% if not salt['cmd.run']('rpm -qa | grep vagrant') %}
Download vagrant:
  file.managed:
    - name: /tmp/vagrant.rpm
    - source: {{ bs.vagrant.url }}/{{ bs.vagrant.ver }}/{{ vrpm }}
    - source_hash: sha256={{ bs.vagrant.hash }}

Install vagrant:
  pkg.installed:
    - sources:
      - vagrant: /tmp/vagrant.rpm
    - requires:
      - file: Download vagrant
{% endif %}
