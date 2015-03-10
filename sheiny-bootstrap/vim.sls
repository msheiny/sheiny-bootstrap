
{% set home = '/home/msheiny' %}
{% set user = 'msheiny' %}
{% set group = 'msheiny' %}

{% for dir in ['.vim/bundle','.fonts','.fonts.conf.d'] %}
Create {{ dir }}:
  file.directory:
    - name: {{ home }}/{{ dir }}
    - user: {{ user }}
    - group: {{ group }}
    - makedirs: True
{% endfor %}

https://github.com/gmarik/Vundle.vim.git:
  git.latest:
    - target: {{ home }}/.vim/bundle/Vundle.vim
    - user: {{ user }}
    - rev: master

vim +PluginInstall +qall:
  cmd.run:
    - user: {{ user }}
    - env:
      - HOME: {{ home }}

/usr/share/fonts/PowerlineSymbols.otf:
  file.managed:
    - source: salt://sheiny-bootstrap/files/powerlinesymbols.otf

fc-cache -vf:
  cmd.run

/etc/fonts/conf.d/10-powerline-symbols.conf:
  file.managed:
    - source: salt://sheiny-bootstrap/files/10-powerline-symbols.conf
