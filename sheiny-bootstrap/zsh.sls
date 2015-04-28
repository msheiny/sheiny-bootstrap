{% from 'sheiny-bootstrap/map.jinja' import bootstrap %}
{% from 'sheiny-bootstrap/map.jinja' import config %}

Git pull down ohmyzsh:
  git.latest:
    - name: {{ bootstrap.ohmyzsh_repo }}
    - rev: master
    - target: {{ config.home }}/.oh-my-zsh
    - user: {{ config.user }}

Change {{ config.user }}'s shell to zsh:
  user.present:
    - name: {{ config.user }}
    - remove_groups: False
    - shell: {{ salt['cmd.run']('which zsh') }}

{% if grains['os_family'] == 'Debian' %}
Source profile to zshrc:
  cmd.run:
    - name: echo 'source /etc/profile' >> /etc/zsh/zprofile
    - unless: echo 'source /etc/profile' >> /etc/zsh/zprofile
{% endif %}
