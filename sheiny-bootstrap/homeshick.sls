{% from 'sheiny-bootstrap/map.jinja' import bootstrap %}

{% load_yaml as hs %}
  hs_root: "{{ bootstrap.home }}/.homesick"
  hs_loc: {{ bootstrap.home }}/.homesick/repos/homeshick
  castle: {{ bootstrap.my_repo_name }}
  hs_clone: {{ bootstrap.user }}/{{ bootstrap.my_repo_name }}
  user: {{ bootstrap.user }}
  group: {{ bootstrap.group }}
{% endload %}

{{ hs.hs_root }}/repos:
  file.directory:
    - user: {{ bootstrap.user }}
    - group: {{ bootstrap.group }}
    - makedirs: True

{{ bootstrap.homeshick }}:
  git.latest:
    - rev: master
    - target: {{ hs.hs_root }}/repos/homeshick
    - user: {{ bootstrap.user }}

Update homeshick:
  cmd.run:
    - name: {{ hs.hs_loc }}/bin/homeshick pull -f {{ hs.castle }} 
    - user: {{ bootstrap.user }}
    - env:
      - HOME: {{ bootstrap.home }} 
    - onlyif: ls {{ hs.hs_root }}/repos/{{ hs.castle }}

Clone new homeshick:
  cmd.run:
    - name: {{ hs.hs_loc }}/bin/homeshick -f clone {{ hs.hs_clone }}
    - user: {{ bootstrap.user }}
    - env:
      - HOME: {{ bootstrap.home }} 
    - creates: {{ hs.hs_root }}/repos/{{ hs.castle }}

Link homeshick:
  cmd.run:
    - name: {{ hs.hs_loc }}/bin/homeshick link -f {{ hs.castle }}
    - user: {{ bootstrap.user }}
    - env:
      - HOME: {{ bootstrap.home }} 
    - onchanges:
      - cmd: Update homeshick
      - cmd: Clone new homeshick
