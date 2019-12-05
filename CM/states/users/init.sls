devops:
  user.present:
    - fullname: DevOps Engineering
    - uid: {{ salt['pillar.get']('users:devops:uid') }}
    - password: {{ salt['pillar.get']('users:devops:password') }}
    - groups:
      - wheel
    - gid: 10

  ssh_auth.present:
    - user: devops
    - source: salt://users/files/id_rsa.pub
    - require:
      - user: devops

  file.append:
    - name: /etc/sudoers
    - text: |
        ### Edit group wheel
         %wheel ALL=(ALL)       NOPASSWD: ALL
    
    