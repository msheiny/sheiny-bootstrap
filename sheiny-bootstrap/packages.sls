{% from 'sheiny-bootstrap/map.jinja' import pkg %}


Install packages:
  pkg.latest:
    - pkgs:
      - git
      - tmux
      - tree
      - {{ pkg.svn }}
      - {{ pkg.py3 }}
{% if grains['os'] != 'MacOS' %}
      - {{ pkg.sshfs }}
      - {{ pkg.dig }}
      - {{ pkg.vim }}
      - {{ pkg.locate }}
      - {{ pkg.venvwrapper }}
      - {{ pkg.pep8 }}
      - {{ pkg.ipy }}
      - {{ pkg.ipy3 }}
      - {{ pkg.py3dev }}
      - htop
      - python-pip
      - ruby
      - tcpdump
      - nmap
      - telnet
      - screen
      - wget
      - gcc
      - make
      - fontconfig
      - zsh
      - python3-pep8
    {% if grains['os'] == 'Ubuntu' %}
      - linux-source
      - exuberant-ctags
    {% elif grains['os'] == 'Fedora' %}
      - ImageMagick #manipulating images via cli
      - perl-Image-ExifTool #manipulating images via cli
      - simple-mtpfs  # For mounting mtp devices in userspace
      - remmina-plugins-rdp # RDP tool
      - python-flake8
      - python3-flake8
      {% if salt['cmd.run']("runlevel | cut -d' ' -f 2") == '5'  %}
      - firefox
      - mono-core # Needed for KeePass
      - mono-winforms # Needed for KeePass
      - gimp
      - libreoffice
      - wine
      - geany-plugins-markdown
      - wireshark
      - pidgin-otr
      - shutter
      - hexchat
      {% endif %}
      {% if salt['cmd.run']("pgrep gnome-shell")  %}
      - gnome-tweak-tool
      - gnome-shell-extension-user-theme
      {% endif %}
    {% endif %}
{% elif grains['os'] == 'MacOS' %}
      - pyenv-virtualenvwrapper
{% endif %}


{% if salt['cmd.run']("runlevel | cut -d' ' -f 2") == '5' and
   grains['os'] == 'Fedora' %}
Dropbox:
  pkgrepo.managed:
    - humanname: Dropbox
    - baseurl: https://linux.dropbox.com/fedora/$releasever/
    - gpgkey: https://linux.dropbox.com/fedora/rpm-public-key.asc
    - gpgcheck: 1

  pkg.latest:
    - name: nautilus-dropbox
    - refresh: True
    - require:
      - pkgrepo: Dropbox
{% endif %}
