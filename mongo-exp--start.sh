#!/usr/bin/env bash
#
docker run -d -p 8081:8081 --name mongo-exp \
  -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin \
  -e ME_CONFIG_MONGODB_ADMINPASSWORD=password \
  -e ME_CONFIG_MONGODB_SERVER=mongo-dbs \
  --network mongo-net \
  mongo-express:1.0.0-alpha.4;
  
