base:
  '*':
    - users
    - yum-s3

  'roles:jenkins':
    - match: grain
    - jenkins
    - nginx.jenkins
    - docker
    - packer
    
  'roles:frontend':
    - match: grain
    - nodejs
    - movie-ui
  
  'roles:backend':
    - match: grain
    - nodejs
    - movie-back

