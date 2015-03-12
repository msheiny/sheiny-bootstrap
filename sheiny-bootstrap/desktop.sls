# Install Google Chrome
#
{% if grains['os_family'] == 'RedHat' and salt['cmd.run']('runlevel | grep 5')%}
Install Google Chrome:
  file.managed:
    - name: /etc/yum.repos.d/google-chrome.repo
    - source: salt://sheiny-bootstrap/files/google-chrome.repo

  pkg.latest:
    - name: google-chrome-stable
    - require:
      - file: Install Google Chrome

{% endif %}
