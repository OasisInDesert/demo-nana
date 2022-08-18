#!/usr/bin/env bash
#
docker run -d -p 3000:3000 --name mongo-app --network mongo-net mongo
  
