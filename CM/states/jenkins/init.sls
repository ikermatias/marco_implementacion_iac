include:
  - docker


jenkins_prereq:
  pkg.installed:
    - pkgs:
      - java-1.8.0-openjdk-devel
      - gcc
      - make
      - createrepo
      - jq
      - httpd-tools

jenkins:
  pkg.installed:
    - sources:
      - jenkins: http://pkg.jenkins.io/redhat-stable/jenkins-2.176.3-1.1.noarch.rpm
    - require:
      - pkg: jenkins_prereq

  user.present:
    - groups:
      - docker
    - require:
      - pkg: docker

  service.running:
    - enable: True
    - reload: True
    - require:
      - pkg: jenkins
      - user: jenkins

  file.append:
    - name: /etc/sysconfig/jenkins
    - text: |
        ### Salt config 
        JENKINS_LISTEN_ADDRESS="127.0.0.1"
        JENKINS_AJP_PORT="-1"
    - require:
      - pkg: jenkins
    - require_in:
      - service: jenkins
    - watch_in:
      - service: jenkins
