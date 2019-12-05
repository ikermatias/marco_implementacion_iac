include:
  - nginx


/etc/nginx/conf.d/demo-app.conf:
  file.managed:
    - source: salt://nginx/files/demo-app.conf
    - require_in:
      - service: nginx
    - watch_in:
      - service: nginx