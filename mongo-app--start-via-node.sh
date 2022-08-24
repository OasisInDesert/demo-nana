#!/usr/bin/env bash
#
docker run --name mongo-app --network mongo-net -d -p 3000:3000 -v /home/nurezi/demo-nana/app:/home/app node:13.14.0-alpine3.11 node /home/app/server.js
# docker run --name mongo-app --network mongo-net -d -p 3000:3000 -v /home/nurezi/demo-nana/app:/home/app node:18.7.0-alpine3.16 node /home/app/server.js
  
