#!/usr/bin/env bash
#
# docker build -t oasisindesert/mongo-app:1.0.1 .

echo 'creating mongo-app image'
docker build -t mongo-app:1.0.1 -t mongo-app:latest .
echo
  
