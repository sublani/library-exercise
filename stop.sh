#!/bin/bash

docker stop $(docker ps | awk '{print $1}')

docker system prune --all -f


