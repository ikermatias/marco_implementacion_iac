packer:
  archive.extracted:
    - name: /opt/
    - source: 'https://releases.hashicorp.com/packer/1.4.3/packer_1.4.3_linux_amd64.zip'
    - archive_format: zip
    - skip_verify: true
    - if_missing: /opt/packer
    - enforce_toplevel: false

  cmd.wait:
    - name: 'chmod +x /opt/packer'
    - watch:
      - archive: packer
      