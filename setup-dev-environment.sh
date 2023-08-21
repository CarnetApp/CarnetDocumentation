#!/bin/bash
mkdir dev
cd dev
cur=`pwd`
git clone https://github.com/CarnetApp/CarnetNextcloud
git clone https://github.com/CarnetApp/CarnetWebClient
cd CarnetWebClient
yarn install
yarn run webpack
cd ..
git clone https://github.com/CarnetApp/CarnetAndroid
cp -R ../nextcloud-docker ./nextcloud-docker
cd nextcloud-docker
echo "We need root access to get and launch nextcloud docker"
sudo docker-compose pull
sudo docker-compose up -d
sleep 30
sudo docker-compose down
mv docker-compose2.yml docker-compose.yml
sudo docker-compose up -d
cd $cur

