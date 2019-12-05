{% set APP_VERSION = salt['cmd.run']('cat /tmp/APP_VERSION') %}

include:
  - nodejs

movie-app:
  pkg.installed:
    - name: movie-app
    - version: {{ APP_VERSION }}
    - require_in:
      - service: nginx

movie-app.service:      
  file.managed:
    - name: /etc/systemd/system/movie-app.service
    - source: salt://movie-ui/files/movie-app.service
    - require:
      - pkg: movie-app
    - onchanges_in:
      - cmd: system-reload

/var/www/movie-app/server.js:
  file.managed:
    - mode: 777
    - require:
      - pkg: movie-app

system-reload:
  cmd.run:
    - name: "sudo systemctl --system daemon-reload"
    - onchanges:
      - file: movie-app.service

  service.running:
    - name: movie-app
    - reload: True
    - enable: True
    - require:
      - pkg: movie-app
