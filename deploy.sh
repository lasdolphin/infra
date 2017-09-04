#!/bin/bash
git clone https://github.com/Artemmkin/reddit.git
cd reddit && bundle install
puma -d
echo "port detection"
echo `ps aux|grep -m1 puma`
PORT=`ps aux|grep -m1 puma| awk '{print $13}'| tr -d '()'| awk 'BEGIN { FS = ":" } ; { print $3 }'`
echo $PORT
EXTIP=`curl ipecho.net/plain`
echo "application deployed succesfully."
echo "you can connect and check."
echo "http://$EXTIP:$PORT"