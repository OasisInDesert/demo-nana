#!/usr/bin/env bash
#
docker volume create mongo-dbs-data
#
docker run -d -p 27017:27017 --name mongo-dbs \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_PASSWORD=password \
  --network mongo-net \
  -v mongo-dbs-data:/data/db \
  mongo:5.0.10;
  
