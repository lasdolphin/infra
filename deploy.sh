#!/bin/bash
# export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
# echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
# curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# sudo apt-get update && sudo apt-get install google-cloud-sdk
# gcloud init --account --project otus-devops
git clone https://github.com/Artemmkin/reddit.git
cd reddit && bundle install
puma -d
PORT=`ps aux|grep -m1 puma| awk '{print $13}'| tr -d '()'| awk 'BEGIN { FS = ":" } ; { print $3 }'`
# gcloud compute firewall-rules create default-puma-server --allow tcp:$PORT --source-tags=puma-server --source-ranges=0.0.0.0/0 --description="puma server port rule"
EXTIP=`curl ipecho.net/plain`
echo "application deployed succesfully."
echo "you can connect and check."
echo "http://$EXTIP:$PORT"