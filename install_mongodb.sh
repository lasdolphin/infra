#!/bin/bash
MONGO_CHECK1_EXPECTED="enabled"
MONGO_CHECK2_EXPECTED="active (running)"
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
# sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
# sudo apt-get update && sudo apt-get install -y mongodb-org
# sudo systemctl start mongod
# sudo systemctl enable mongod
MONGO_CHECK1=`sudo systemctl status mongod|grep enabled| awk 'BEGIN {FS = ";"} {print $2}'|tr -d ' '`
MONGO_CHECK2=`sudo systemctl status mongod|grep 'active (running)'|awk 'BEGIN {FS = ":"} {print $2}'|awk '{print $1" "$2}'`
echo "$MONGO_CHECK1_EXPECTED vs $MONGO_CHECK1" 
echo "$MONGO_CHECK2_EXPECTED vs $MONGO_CHECK2" 
if [ "$MONGO_CHECK1" == "$MONGO_CHECK1_EXPECTED" ] && [ "$MONGO_CHECK2" == "$MONGO_CHECK2_EXPECTED" ]
then
    echo "MONGO STARTED SUCCESFULLY"
    exit 0
else
    echo "MONGO NOT RUNNING PROPERLY"
    exit
fi