{% from "sheiny-bootstrap/map.jinja" import config with context %}
{% from "sheiny-bootstrap/map.jinja" import os_config with context %}

include:
  - sheiny-bootstrap.homeshick

{% if grains['os'] == 'Fedora' %}
Powerline package:
  pkg.latest:
    - name: powerline
{% endif %}

{% for dir in ['.vim/bundle','.fonts','.fonts.conf.d'] %}
Create {{ dir }}:
  file.directory:
    - name: {{ config.home }}/{{ dir }}
    - user: {{ config.user }}
    - group: {{ config.group }}
    - makedirs: True
{% endfor %}

https://github.com/gmarik/Vundle.vim.git:
  git.latest:
    - target: {{ config.home }}/.vim/bundle/Vundle.vim
    - user: {{ config.user }}
    - rev: master

vim +PluginInstall +qall:
  cmd.run:
    - user: {{ config.user }}
    - env:
      - HOME: {{ config.home }}

https://github.com/powerline/fonts.git:
  git.latest:
    - target: {{ config.pline_tmpdir }}
    - user: {{ config.user }}
    - rev: master

Install fonts:
  cmd.script:
    - source: salt://sheiny-bootstrap/files/install-vim-fonts.sh
    - user: {{ config.user }}
    - template: jinja
    - defaults:
      plinefontsdir: {{ config.pline_tmpdir }}

{% if grains['os'] != 'MacOS' %}
fc-cache -vf:
  cmd.run:
    - user: {{ config.user }}

/etc/fonts/conf.d/10-powerline-symbols.conf:
  file.managed:
    - source: salt://sheiny-bootstrap/files/10-powerline-symbols.conf
{% endif %}
