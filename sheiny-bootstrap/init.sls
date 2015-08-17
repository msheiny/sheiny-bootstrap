include:
  - .packages
  - .homeshick
  - .zsh
  - .vim
  {% if salt['cmd.run']("runlevel | cut -d' ' -f 2") == '5'  %}
  - .vbox
  - .desktop
  {% endif %}
