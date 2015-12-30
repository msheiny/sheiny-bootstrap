{% from 'sheiny-bootstrap/map.jinja' import bootstrap as bs %}

{% set vrpm = "vagrant_"+ bs.vagrant.ver +"_x86_64.rpm" %}

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
