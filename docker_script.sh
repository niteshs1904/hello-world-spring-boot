#!/bin/bash
#Considering the build image is pushed on the registry
#
docker pull spring-boot:v1
#
#To remove the container as springboot name is given during the spinup in Jenkinsfile
#Restart with the version of the image downloaded in step above
#
echo "\n >>>>>>#####Please wait for a while as application is preparing#####<<<<<<\n"
CONTAINER_NAME="springboot"
ID="$(docker container ls -aq --filter=name="$CONTAINER_NAME")"
if [ -n "$ID" ]; then
  echo "####Removing the existing container####\n"
  docker container stop $ID && docker container rm $ID
else
  echo "####Springboot is not running####\n" 
fi
echo "####Preparing application with new container####\n"
docker container run -itd --name springboot -p 8080:8080 spring-boot:v1  
sleep 20;
#
#
#Verify that the container started successfully
#
echo "\n ####Checking container status####\n"
ID="$(docker container ls -aq --filter=name="$CONTAINER_NAME")"
if [[ -n "$ID" ]];
then
  echo "The container is running"
else
  echo "The container is not running"
fi
#
#Verify application is running successfully
#
echo "\n ####Checking application status#####"
if curl -I "http://localhost:8080" 2>&1 | grep -w "200\|301" ; then
    echo "Application is running"
else
    echo "Application is down"
fi

