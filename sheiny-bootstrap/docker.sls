{% from 'sheiny-bootstrap/map.jinja' import bootstrap as bs %}
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
      - {{ bs.user }}
    - require:
      - pkg: Install docker

Move docker lib folder:
  file.symlink:
    - name: /var/lib/docker
    - target: /docker
    - force: True
    - backupname: /var/lib/docker-bak
    - makedirs: True
    - require:
      - pkg: Install docker

docker-compose:
  file.managed:
    - source: {{bs.compose_url}}/{{bs.compose_ver}}/docker-compose-Linux-x86_64
    - name: {{bs.compose_file}}
    - source_hash: {{bs.compose_hash}}
    - mode: 755
    - require:
      - pkg: Install docker

