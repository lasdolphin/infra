#!/bin/bash
cd ~
echo "source ~/.rvm/scripts/rvm "
source ~/.rvm/scripts/rvm

git clone https://github.com/Artemmkin/reddit.git
cd reddit && bundle install

echo `pwd`
echo `whoami`
rvm wrapper default systemd puma
cp /home/appuser/puma.service /etc/systemd/system/
systemctl enable puma.service
systemctl start puma.service