
install_nginx:
   cmd.run:
      - name: "sudo amazon-linux-extras install -y nginx1.12"


nginx:
  service.running:
     - name: nginx
     - enable: True
     - reload: True
     
