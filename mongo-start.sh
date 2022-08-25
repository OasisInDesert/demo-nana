#!/usr/bin/env bash
#

echo 'cleaning up ...'
for i in mongo-app mongo-exp mongo-dbs; do docker stop "$i" 2> /dev/null; docker rm "$i" 2> /dev/null; done
docker network rm mongo-net 2> /dev/null
echo


echo 'creating volume mongo-dbs-data ...'
docker volume create mongo-dbs-data 2> /dev/null
echo


echo 'creating network mongo-net ...'
if [[ -z $(docker network ls -f name=mongo-net -q) ]]; then
  echo 'creating mongo-net network ..'
  docker network create mongo-net
  echo
fi
echo


echo 'starting mongo-dbs container ...'
docker run -d -p 27017:27017 --name mongo-dbs \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_PASSWORD=password \
  --network mongo-net \
  -v mongo-dbs-data:/data/db \
  mongo:5.0.10;
echo


echo 'waiting 5 seconds for mongo-dbs initialization...'
sleep 5
echo


echo 'starting mongo-exp container'
docker run -d -p 8081:8081 --name mongo-exp \
  -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin \
  -e ME_CONFIG_MONGODB_ADMINPASSWORD=password \
  -e ME_CONFIG_MONGODB_SERVER=mongo-dbs \
  --network mongo-net \
  --restart always \
  mongo-express:1.0.0-alpha.4;
echo

# if [[ -z $(docker image ls | grep 'mongo-app') ]]; then 
#  echo 'building image for the mongo-app'
#  docker build -t mongo-app:1.0.1 -t mongo-app:latest .
#  echo
#  fi

echo 'starting  mongo-app container'
docker run -d -p 3000:3000 --name mongo-app --network mongo-net mongo-app:latest
echo

echo 'completed!'
echo


  
