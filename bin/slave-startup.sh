#!/bin/bash

SLAVE_NAME=jenkins-slave
CONTAINER_VERSION=latest
MASTER_HOST=127.0.0.1
MASTER_PORT=8080
#JENKINS_SECRET=

docker stop $SLAVE_NAME
docker rm $SLAVE_NAME

if [ ! -d ~/docker/$SLAVE_NAME ] ; then
  mkdir ~/docker_jenkins_home/$SLAVE_NAME
  chown docker:docker ~/docker_jenkins_home/$SLAVE_NAME
  chmod ug+rwx ~/docker_jenkins_home/$SLAVENAME
fi

docker run -rm -v ~/docker_jenkins_home/$SLAVE_NAME:/var/jenkins_home -e "MASTER_HOST=$MASTER_HOST" -e "MASTER_PORT=$MASTER_PORT" -e "SLAVE_NAME=$SLAVE_NAME" -e "JENKINS_SECRET=$JENKINS_SECRET" --name $SLAVE_NAME eficode/jenkins-slave:$CONTAINER_VERSION
