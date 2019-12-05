#!/bin/bash

echo 'Installing Serverspec tests...'
whoami
yum install -y curl gpg gcc gcc-c++ make
gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
usermod -a -G rvm root
usermod -a -G rvm ec2-user
echo "source $HOME/usr/local/rvm/scripts/rvm" >> ~/.bash_profile
source /etc/profile.d/rvm.sh
source ~/.bash_profile
rvm requirements
rvm install ruby
rvm --default use ruby
gem install --no-document rake serverspec
echo 'Running Serverspec tests...'
echo 'testiaaaaaando'
whoami
echo $PATH
#export PATH=/usr/bin:/root/bin:/usr/local/bin
cd /tmp/serverspec && rake spec