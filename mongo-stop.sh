#!/usr/bin/env bash
#
echo 'cleaning up ...'
for i in mongo-app mongo-exp mongo-dbs; do docker stop "$i" 2> /dev/null; docker rm "$i" 2> /dev/null; done
docker network rm mongo-net 2> /dev/null
echo
echo 'completed!'
