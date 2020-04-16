#!/bin/bash

echo -e "\033[1;32m*) Preparing your public ssh key to become available in authorized_keys in the docker container... \033[0m"
cp ~/.ssh/id_rsa.pub authorized_keys

echo -e "\033[1;32m*) Building docker container... \033[0m"
docker build -t gpr:latest .

echo -e "\033[1;32mDone \033[0m"
