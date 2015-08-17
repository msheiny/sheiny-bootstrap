{% from 'sheiny-bootstrap/map.jinja' import bootstrap %}
{% from "sheiny-bootstrap/map.jinja" import config with context %}

{% load_yaml as hs %}
  hs_root: "{{ config.home }}/.homesick"
  hs_loc: {{ config.home }}/.homesick/repos/homeshick
  castle: {{ bootstrap.my_repo_name }}
  hs_clone: {{ config.user }}/{{ bootstrap.my_repo_name }}
  user: {{ config.user }}
  group: {{ config.group }}
{% endload %}

{{ hs.hs_root }}/repos:
  file.directory:
    - user: {{ config.user }}
    - group: {{ config.group }}
    - makedirs: True

{{ bootstrap.homeshick }}:
  git.latest:
    - rev: master
    - target: {{ hs.hs_root }}/repos/homeshick
    - user: {{ config.user }}

Update homeshick:
  cmd.run:
    - name: {{ hs.hs_loc }}/bin/homeshick pull -f {{ hs.castle }} 
    - user: {{ config.user }}
    - env:
      - HOME: {{ config.home }} 
    - onlyif: ls {{ hs.hs_root }}/repos/{{ hs.castle }}

Clone new homeshick:
  cmd.run:
    - name: {{ hs.hs_loc }}/bin/homeshick -f clone {{ hs.hs_clone }}
    - user: {{ config.user }}
    - env:
      - HOME: {{ config.home }} 
    - creates: {{ hs.hs_root }}/repos/{{ hs.castle }}

Link homeshick:
  cmd.run:
    - name: {{ hs.hs_loc }}/bin/homeshick link -f {{ hs.castle }}
    - user: {{ config.user }}
    - env:
      - HOME: {{ config.home }} 

{% if grains['os'] == 'MacOS' %}

{{ bootstrap.dotsheiny }}:
  git.latest:
    - rev: macosx
    - target: {{ hs.hs_root }}/repos/{{ bootstrap.mac_castle_name }}
    - user: {{ config.user }}

Link mac-specific homeshick:
  cmd.run:
    - name: {{ hs.hs_loc }}/bin/homeshick link -f {{ hs.castle }}
    - user: {{ config.user }}
    - env:
      - HOME: {{ config.home }} 
    - require:
      - git: {{ bootstrap.dotsheiny }}
{% endif %}
