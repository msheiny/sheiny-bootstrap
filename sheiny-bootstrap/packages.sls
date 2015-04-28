Install packages:
  pkg.latest:
    - pkgs:
      - git
      - tmux
      - tree
      - zsh
  {% if grains['os'] != 'MacOS' %}
      - git
      - tmux
      - tree
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
    {% if grains['os'] == 'Ubuntu' %}
      - dnsutils
      - python3-minimal
      - linux-source
      - exuberant-ctags
      - virtualenvwrapper
      - locate
    {% elif grains['os_family'] == 'RedHat' %}
      - python-virtualenvwrapper
      - python3-ipython
      - python3-devel
      - python3-pep8
      - python-pep8
      {% if grains['os'] == 'Fedora' %}
      - vim-enhanced
      - ImageMagick #manipulating images via cli
      - perl-Image-ExifTool #manipulating images via cli
      - simple-mtpfs  # For mounting mtp devices in userspace
      - remmina-plugins-rdp # RDP tool
      {% if salt['cmd.run']("runlevel | cut -d' ' -f 2") == '5'  %}
      - firefox
      - mono-core # Needed for KeePass
      - mono-winforms # Needed for KeePass
      - gimp
      - libreoffice
      - wine
      - geany-plugins-markdown
      {% endif %}
      {% if salt['cmd.run']("pgrep gnome-shell")  %}
      - gnome-tweak-tool
      - gnome-shell-extension-user-theme
      {% endif %}
      {% endif %}
    {% elif grains['os'] == 'opensuse' %}
      - bind-utils
      - python3-base
      - findutils-locate
      - kernel-source
      - ctags
    {% endif %}
  {% elif grains['os'] == 'MacOS' %}
      - python3
      - pyenv-virtualenvwrapper
  {% endif %}
