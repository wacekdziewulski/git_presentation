#!/bin/bash

echo -e "\033[1;32m*) Building docker container... \033[0m"
docker build -t gpr:latest .

echo -e "\033[1;32mDone \033[0m"
