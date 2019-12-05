require 'spec_helper'

versionFile = open('/tmp/APP_VERSION')
appVersion = versionFile.read.chomp

describe package("movie-app-#{appVersion}") do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe user('devops') do
  it { should exist }
  it { should have_authorized_key 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDSm+6WGk++62N/qdgmdG1WRI/UXYyKCCGSUIEhgb5eMPy0tiZgbRVO5TO7DpZL08EiFrhdrvu0rjuNxTImfTMMIDJQC3QBJ0o/yJqauYXu/CnXESMVSmP0q8N1RUn/lIXQLzhy2cnMgwCVCyp0Z29iwf8KGO7MvFia565chCx289bGYTkxd71fpfY+YRR68OlkbJaN/KogtpG/ythLIzXE1l7/5BCpmRqZ+MDxZFccs3KbA2ncBNLnBp4OF5ndmyELEGwJgd9Qp81wCWswqnl77yFmPcyd3CsykHWrE6KZSIv+6Uk4FwIfFlTfXQJo7NXPD1K+dpkj4Ennxi0Cdcz3 user@DESKTOP-L90M7DM' }
end