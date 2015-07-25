{% from 'sheiny-bootstrap/homeshick.sls' import hs %}
{% set osver = grains['osrelease'] %}

Install docker:
  pkgrepo.managed:
    - name: docker
    - humanname: Docker Repository
    - baseurl: https://yum.dockerproject.org/repo/main/fedora/{{ osver }}
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: https://yum.dockerproject.org/gpg

  pkg.latest:
    - name: docker-engine
    - refresh: True

Docker group:
  group.present:
    - name: docker
    - addusers:
      - {{ hs.user }}
