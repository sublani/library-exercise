#!/bin/bash

cd /home/sergonji/cursos/curso_DevOps/library-exercise

docker system prune --all -f

docker build -t api:0.1.0 . 

sleep 15

# POR SEPARADO
docker-compose -f docker/docker-compose.db.yml up -d

sleep 20 

docker-compose -f docker/docker-compose.app.yml up -d

# JUNTO
#docker-compose -f docker-compose.api.yml up -d

curl --fail http://localhost:8080/api/