# syntax=docker/dockerfile:1
#
# -- base image
FROM node:18.7.0-alpine3.16
#
# -- create dir for app files
RUN mkdir -p /home/app
#
# -- copy app files
COPY ./app /home/app
#
# -- set default dir so that next commands executes in /home/app dir
WORKDIR /home/app
#
# -- install dependencies
RUN npm install
#
# -- expose ports 
EXPOSE 3000
#
# execute process
CMD ["node", "server.js"]

