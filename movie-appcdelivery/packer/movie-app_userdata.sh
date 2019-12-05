#!/bin/bash

set -euf -o pipefail
exec 1> >(logger -s -t $(basename $0)) 2>&1

# Install SaltStack
sudo yum -y install https://repo.saltstack.com/yum/redhat/salt-repo-latest.el7.noarch.rpm
sudo yum clean expire-cache;sudo yum -y install salt-minion; chkconfig salt-minion off

# Install Ruby



# Put custom grains in place
echo -e 'grains:\n roles:\n  - frontend' > /etc/salt/minion.d/grains.conf