#!/bin/bash

echo -e "\033[1;32m*) Killing docker container if it was running\033[0m"
docker kill gpr_docker
echo -e "\033[1;32m*) Removing old docker container\033[0m"
docker rm gpr_docker
echo -e "\033[1;32m*) Running new docker image\033[0m"
docker run -d -p 4444:22 --name gpr_docker gpr:latest

echo -e "\033[1;32m*) Cleaning up repository\033[0m"
rm -Rf gpr
echo -e "\033[1;32m*) Cloning new repo\033[0m"
git clone ssh://gituser@localhost:4444/home/gituser/gpr
