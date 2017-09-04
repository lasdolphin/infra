#!/bin/bash

git clone https://github.com/lasdolphin/infra.git

cd infra
git checkout config-scripts

sudo -u appuser bash install_ruby.sh
bash install_mongodb.sh
sudo -u appuser bash deploy.sh